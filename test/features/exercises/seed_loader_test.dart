import 'package:drift/native.dart';
import 'package:fitness_buddy/core/data/database.dart';
import 'package:fitness_buddy/features/exercises/services/seed/exercise_seed_loader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase db;
  late ExerciseSeedLoader seeder;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    seeder = ExerciseSeedLoader(db);
    await db.userDao.upsertUser(AppUserTableCompanion.insert(
      id: 'local',
      userName: 'Athlete',
      createdAt: 0,
    ));
  });

  tearDown(() => db.close());

  test('seeds 195 system exercises and is idempotent', () async {
    await seeder.loadSystemExercises();
    final first = await db.exerciseDao.getSystemExercises();
    expect(first, hasLength(195));

    await seeder.loadSystemExercises();
    final second = await db.exerciseDao.getSystemExercises();
    expect(second, hasLength(195));

    final version = await db.appMetadataDao.getValue('system_exercises_version');
    expect(version, '1');
  });

  test('links every system exercise to the user with profile + policy',
      () async {
    await seeder.loadSystemExercises();
    await seeder.linkSystemExercisesToUser('local');

    final links = await db.exerciseDao.getUserExercises('local');
    expect(links, hasLength(195));

    // Every link has exactly one profile and one progression policy.
    final strengthProfiles = await db.select(db.strengthProfileTable).get();
    final cardioProfiles = await db.select(db.cardioProfileTable).get();
    expect(strengthProfiles.length + cardioProfiles.length, 195);

    final policies = await db.select(db.progressionPolicyTable).get();
    expect(policies, hasLength(195));

    // Modalities landed as enum names, not display labels.
    expect(
      strengthProfiles.every((p) => p.strengthModality ==
          p.strengthModality.toLowerCase().replaceAll(' ', '') ||
          !p.strengthModality.contains(' ')),
      isTrue,
      reason: 'modality strings must be enum .name values',
    );

    // Re-linking is a no-op.
    await seeder.linkSystemExercisesToUser('local');
    expect(await db.exerciseDao.getUserExercises('local'), hasLength(195));
  });

  test('generates the two sample routines once', () async {
    await seeder.loadSystemExercises();
    await seeder.linkSystemExercisesToUser('local');
    await seeder.generateSampleRoutinesForUser('local');

    expect(await db.routineDao.countRoutines('local'), 2);
    final routines = await db.select(db.routineTable).get();
    final upper = routines.firstWhere((r) => r.name == 'Upper Body Push');
    final links = await db.routineDao.getRoutineExercises(upper.id);
    expect(links, hasLength(7));
    expect(links.map((l) => l.exPosition).toList(), [0, 1, 2, 3, 4, 5, 6]);

    // Guarded by routine-count: second run adds nothing.
    await seeder.generateSampleRoutinesForUser('local');
    expect(await db.routineDao.countRoutines('local'), 2);
  });
}
