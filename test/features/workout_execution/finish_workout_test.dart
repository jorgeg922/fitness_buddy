import 'package:drift/native.dart';
import 'package:fitness_buddy/core/data/database.dart';
import 'package:fitness_buddy/core/taxonomy/body_part.dart';
import 'package:fitness_buddy/features/common/models/measurement_system.dart';
import 'package:fitness_buddy/features/exercises/services/seed/exercise_seed_loader.dart';
import 'package:fitness_buddy/features/workout_execution/models/models_dto/workout_input_bundle.dart';
import 'package:fitness_buddy/features/workout_execution/models/models_dto/workout_set_draft.dart';
import 'package:fitness_buddy/features/workout_execution/services/workout_bundle_loader.dart';
import 'package:fitness_buddy/features/workout_execution/use_cases/finish_workout_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase db;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    await db.userDao.upsertUser(AppUserTableCompanion.insert(
        id: 'local', userName: 'Athlete', createdAt: 0));
    final seeder = ExerciseSeedLoader(db);
    await seeder.loadSystemExercises();
    await seeder.linkSystemExercisesToUser('local');
    await seeder.generateSampleRoutinesForUser('local');
  });

  tearDown(() => db.close());

  WorkoutSetDraft set(double weight, int reps) =>
      WorkoutSetDraft(weight: weight, reps: reps, isCompleted: true);

  test('full lifecycle: load bundle → finish → logs, rollups, usage, PRs',
      () async {
    final loader = WorkoutBundleLoader(db, MeasurementSystem.us);
    final routines = await db.select(db.routineTable).get();
    final routine = routines.firstWhere((r) => r.name == 'Upper Body Push');

    final bundle =
        await loader.loadForRoutine('local', routine.id, routine.name);
    expect(bundle.exercises, hasLength(7));
    // Fresh user: no history, so default empty prepopulation.
    expect(bundle.exercises.first.previousSets, isEmpty);
    expect(bundle.exercises.first.prepopulatedSets, hasLength(3));

    // Complete sets for the first two exercises, skip the rest.
    final results = <CompletedExerciseResult>[
      CompletedExerciseResult(
        data: bundle.exercises[0],
        completedSets: [set(135, 8), set(135, 8), set(140, 6)],
        wasSkipped: false,
      ),
      CompletedExerciseResult(
        data: bundle.exercises[1],
        completedSets: [set(185, 5)],
        wasSkipped: false,
      ),
      for (final e in bundle.exercises.skip(2))
        CompletedExerciseResult(
            data: e, completedSets: const [], wasSkipped: true),
    ];

    final useCase = FinishWorkoutUseCase(db, MeasurementSystem.us);
    final res = await useCase.processWorkout(
        bundle: bundle, results: results, durationSeconds: 1800);

    expect(res.isOk, isTrue, reason: res.isErr ? '${res.error}' : null);
    final summary = res.value;
    expect(summary.exerciseCount, 2);
    expect(summary.completedSetCount, 4);
    expect(summary.prs, isNotEmpty); // first session is all PRs
    expect(summary.bodyPartUsage.keys, isNotEmpty);

    // History spine written.
    final logs = await db.select(db.workoutLogTable).get();
    expect(logs, hasLength(1));
    expect(logs.single.routineNameSnapshot, 'Upper Body Push');
    final perfs = await db.select(db.exercisePerformanceLogTable).get();
    expect(perfs, hasLength(2));
    final sets = await db.select(db.setLogTable).get();
    expect(sets, hasLength(4));

    // Derived stats written.
    final rollups = await db.select(db.historyStatsRollupTable).get();
    expect(rollups, hasLength(2));
    final ex0 = bundle.exercises[0].exercise;
    final rollup0 =
        rollups.firstWhere((r) => r.userExerciseId == ex0.id);
    // Volume = (135*8 + 135*8 + 140*6) × multiplier (Incline Bench = 1).
    expect(rollup0.totalVolume, 135 * 8 + 135 * 8 + 140 * 6);
    expect(rollup0.maxWeight, 140);

    final aggregates =
        await db.select(db.exerciseOverallAggregateTable).get();
    expect(aggregates, hasLength(2));
    expect(aggregates.every((a) => a.timesCompleted == 1), isTrue);

    // Muscle usage: both exercises are chest/shoulders family.
    final usage = await db.select(db.muscleUsageDailyTable).get();
    expect(usage, isNotEmpty);
    final usedParts = usage.map((u) => BodyPart.parse(u.bodyPart)).toSet();
    expect(usedParts, contains(ex0.bodyPart));

    // Routine stamped; drafts cleared; user exercise lastPerformedAt set.
    final stamped = await db.routineDao.getRoutine(routine.id);
    expect(stamped!.lastCompletedAt, isNotNull);
    expect(await db.workoutDraftDao.getDrafts('local'), isEmpty);

    // Second bundle load now prepopulates from history.
    final bundle2 =
        await loader.loadForRoutine('local', routine.id, routine.name);
    expect(bundle2.exercises[0].previousSets, hasLength(3));
    expect(bundle2.exercises[0].prepopulatedSets.first.weight, 135);
    expect(bundle2.exercises[0].prepopulatedSets.first.isCompleted, isFalse);

    // Second identical session: no new PRs.
    final res2 = await useCase.processWorkout(
      bundle: bundle2,
      results: [
        CompletedExerciseResult(
          data: bundle2.exercises[0],
          completedSets: [set(135, 8), set(135, 8), set(140, 6)],
          wasSkipped: false,
        ),
        for (final e in bundle2.exercises.skip(1))
          CompletedExerciseResult(
              data: e, completedSets: const [], wasSkipped: true),
      ],
      durationSeconds: 1500,
    );
    expect(res2.isOk, isTrue);
    expect(res2.value.prs, isEmpty);

    // Same-day rollup accumulated, not replaced.
    final rollupAfter = await db.statsDao
        .getRollup(ex0.id, rollup0.dayEpoch);
    expect(rollupAfter!.setCount, 6);
    expect(rollupAfter.totalVolume, rollup0.totalVolume * 2);
  });

  test('metric input converts to imperial before persisting', () async {
    final loader = WorkoutBundleLoader(db, MeasurementSystem.metric);
    final links = await db.exerciseDao.getUserExercises('local');
    final bundle = await loader.loadAdhoc('local', links.first.id);

    final useCase = FinishWorkoutUseCase(db, MeasurementSystem.metric);
    final res = await useCase.processWorkout(
      bundle: bundle,
      results: [
        CompletedExerciseResult(
          data: bundle.exercises.single,
          completedSets: [set(100, 5)], // 100 kg
          wasSkipped: false,
        ),
      ],
      durationSeconds: 600,
    );
    expect(res.isOk, isTrue);

    final sets = await db.select(db.setLogTable).get();
    // 100 kg ≈ 220.46 lb stored.
    expect(sets.single.weight, closeTo(220.46, 0.01));
  });

  test('no completed sets returns Err and writes nothing', () async {
    final loader = WorkoutBundleLoader(db, MeasurementSystem.us);
    final links = await db.exerciseDao.getUserExercises('local');
    final bundle = await loader.loadAdhoc('local', links.first.id);

    final useCase = FinishWorkoutUseCase(db, MeasurementSystem.us);
    final res = await useCase.processWorkout(
      bundle: bundle,
      results: [
        CompletedExerciseResult(
            data: bundle.exercises.single,
            completedSets: const [],
            wasSkipped: false),
      ],
      durationSeconds: 60,
    );
    expect(res.isErr, isTrue);
    expect(await db.select(db.workoutLogTable).get(), isEmpty);
  });
}
