import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/data/database.dart';
import '../../../core/taxonomy/body_part.dart';
import '../../common/models/measurement_system.dart';
import '../../common/models/result.dart';
import '../../common/models/unit_converter.dart';
import '../../workout_history/models/session_summary.dart';
import '../../workout_history/services/statistics_service.dart';
import '../models/models_dto/workout_input_bundle.dart';
import '../models/models_dto/workout_set_draft.dart';

/// The finish pipeline (doc §8.4, gamification omitted):
/// steps 1–6 are pure computation over preloaded data; the single
/// transaction at the end is the only persistence point — a failure anywhere
/// leaves the draft intact and the workout resumable.
class FinishWorkoutUseCase {
  FinishWorkoutUseCase(this._db, this._ms);

  final AppDatabase _db;
  final MeasurementSystem _ms;

  Future<Result<SessionSummary>> processWorkout({
    required WorkoutExecutionInputBundle bundle,
    required List<CompletedExerciseResult> results,
    required int durationSeconds,
  }) async {
    try {
      final performed = results
          .where((r) => !r.wasSkipped && r.completedSets.isNotEmpty)
          .toList();
      if (performed.isEmpty) {
        return const Err('No completed sets — nothing to save.');
      }

      final now = DateTime.now();
      final performedAt = now.millisecondsSinceEpoch;
      final dayEpoch =
          DateTime(now.year, now.month, now.day).millisecondsSinceEpoch;
      const uuid = Uuid();
      final userId = bundle.userId;
      final workoutLogId = uuid.v4();

      // ---- pure computation phase ----

      final workoutLog = WorkoutLogTableCompanion.insert(
        id: workoutLogId,
        userId: userId,
        routineId: Value(bundle.isAdhoc ? null : bundle.routineId),
        routineNameSnapshot: Value(bundle.routineName),
        isAdhoc: Value(bundle.isAdhoc),
        performedAt: performedAt,
        durationSeconds: Value(durationSeconds),
      );

      final performanceLogs = <ExercisePerformanceLogTableCompanion>[];
      final setLogs = <SetLogTableCompanion>[];
      final rollups = <HistoryStatsRollupTableCompanion>[];
      final aggregates = <ExerciseOverallAggregateTableCompanion>[];
      final prEvents = <PersonalRecordEventTableCompanion>[];
      final prHighlights = <PrHighlight>[];
      final bodyPartUsage = <BodyPart, ({int sets, double score})>{};
      var sessionVolume = 0.0;
      var sessionDistance = 0.0;
      var sessionSets = 0;

      for (final result in performed) {
        final vm = result.data.exercise;
        final performanceLogId = uuid.v4();
        final imperialSets =
            result.completedSets.map(_toImperial).toList();

        performanceLogs.add(ExercisePerformanceLogTableCompanion.insert(
          id: performanceLogId,
          userId: userId,
          workoutLogId: workoutLogId,
          userExerciseId: vm.id,
          routineExerciseId: Value(result.data.routineExerciseId),
          wasPartOfRoutine: Value(!bundle.isAdhoc),
          autoIncrementCountSession:
              Value(result.data.autoIncrementApplied ? 1 : null),
          performedAt: performedAt,
        ));

        for (var i = 0; i < imperialSets.length; i++) {
          final set = imperialSets[i];
          setLogs.add(SetLogTableCompanion.insert(
            id: uuid.v4(),
            userId: userId,
            exercisePerformanceLogId: performanceLogId,
            setNumber: i + 1,
            weight: Value(set.weight),
            reps: Value(set.reps),
            durationSeconds: Value(set.durationSeconds),
            distance: Value(set.distance),
            speed: Value(set.speed),
            restTimeSeconds: Value(set.restTimeSeconds),
          ));
        }

        // Volume multiplier lives on the strength profile row.
        final joined = await _db.exerciseDao.getFullUserExercise(vm.id);
        final volumeMultiplier =
            joined?.strengthProfile?.volumeMultiplier ?? 1.0;

        final stats = StatisticsService.computeSessionStats(
            imperialSets, volumeMultiplier);
        sessionVolume += stats.totalVolume;
        sessionDistance += stats.totalDistance ?? 0;
        sessionSets += stats.setCount;

        final existingRollup = await _db.statsDao.getRollup(vm.id, dayEpoch);
        rollups.add(StatisticsService.mergeRollup(
          userId: userId,
          userExerciseId: vm.id,
          dayEpoch: dayEpoch,
          stats: stats,
          existing: existingRollup,
        ));

        final aggregate = await _db.statsDao.getAggregate(vm.id);
        final supportedPrs = vm.strengthModality?.supportedMetricsPr ??
            vm.cardioModality?.supportedMetricsPr ??
            const {};
        for (final pr in StatisticsService.detectPrs(
          stats: stats,
          supported: supportedPrs,
          aggregate: aggregate,
        )) {
          prEvents.add(PersonalRecordEventTableCompanion.insert(
            id: uuid.v4(),
            userId: userId,
            userExerciseId: Value(vm.id),
            exerciseNameSnapshot: vm.name,
            metric: pr.metric,
            value: pr.value,
            previousValue: Value(pr.previousValue),
            achievedAt: performedAt,
          ));
          prHighlights.add(PrHighlight(
            exerciseName: vm.name,
            metricLabel: pr.metricLabel,
            value: pr.value,
            previousValue: pr.previousValue,
          ));
        }

        aggregates.add(StatisticsService.mergeAggregate(
          userId: userId,
          userExerciseId: vm.id,
          performedAt: performedAt,
          stats: stats,
          existing: aggregate,
        ));

        // Muscle usage: working sets × volume multiplier per body part.
        final usage = bodyPartUsage[vm.bodyPart];
        bodyPartUsage[vm.bodyPart] = (
          sets: (usage?.sets ?? 0) + stats.setCount,
          score: (usage?.score ?? 0) + stats.setCount * volumeMultiplier,
        );
      }

      // Merge muscle usage into today's existing rows.
      final usageCompanions = <MuscleUsageDailyTableCompanion>[];
      for (final entry in bodyPartUsage.entries) {
        final existing = await _db.statsDao
            .getMuscleUsage(userId, entry.key.name, dayEpoch);
        usageCompanions.add(MuscleUsageDailyTableCompanion.insert(
          userId: userId,
          bodyPart: entry.key.name,
          dayEpoch: dayEpoch,
          setsCount: Value((existing?.setsCount ?? 0) + entry.value.sets),
          score: Value((existing?.score ?? 0) + entry.value.score),
        ));
      }

      final overall = await _db.statsDao.getUserOverallStats(userId);
      final dayVolume = sessionVolume; // conservative: per-session compare
      final overallCompanion = UserOverallStatsTableCompanion.insert(
        userId: userId,
        totalWorkouts: Value((overall?.totalWorkouts ?? 0) + 1),
        totalVolume: Value((overall?.totalVolume ?? 0) + sessionVolume),
        totalDistance: Value((overall?.totalDistance ?? 0) + sessionDistance),
        totalSets: Value((overall?.totalSets ?? 0) + sessionSets),
        totalDurationSeconds:
            Value((overall?.totalDurationSeconds ?? 0) + durationSeconds),
        totalExercisesPerformed:
            Value((overall?.totalExercisesPerformed ?? 0) + performed.length),
        strongestDayEpoch: Value(
            dayVolume > (overall?.strongestDayVolume ?? 0)
                ? dayEpoch
                : overall?.strongestDayEpoch),
        strongestDayVolume: Value(dayVolume > (overall?.strongestDayVolume ?? 0)
            ? dayVolume
            : (overall?.strongestDayVolume ?? 0)),
        longestDayEpoch: Value(
            durationSeconds > (overall?.longestDayDurationSeconds ?? 0)
                ? dayEpoch
                : overall?.longestDayEpoch),
        longestDayDurationSeconds: Value(
            durationSeconds > (overall?.longestDayDurationSeconds ?? 0)
                ? durationSeconds
                : (overall?.longestDayDurationSeconds ?? 0)),
      );

      // ---- the single persistence point ----

      await _db.transaction(() async {
        if (!bundle.isAdhoc) {
          await _db.routineDao
              .stampLastCompleted(bundle.routineId, performedAt);
        }
        await _db.historyDao.insertWorkoutLog(workoutLog);
        for (final log in performanceLogs) {
          await _db.historyDao.insertPerformanceLog(log);
        }
        await _db.historyDao.insertSetLogs(setLogs);
        for (final rollup in rollups) {
          await _db.statsDao.upsertRollup(rollup);
        }
        for (final aggregate in aggregates) {
          await _db.statsDao.upsertAggregate(aggregate);
        }
        await _db.statsDao.insertPrEvents(prEvents);
        for (final usage in usageCompanions) {
          await _db.statsDao.upsertMuscleUsage(usage);
        }
        await _db.statsDao.upsertUserOverallStats(overallCompanion);
        for (final result in performed) {
          await _db.exerciseDao
              .markLastPerformed(result.data.exercise.id, performedAt);
        }
        await _db.workoutDraftDao.clearDrafts(userId);
      });

      return Ok(SessionSummary(
        workoutLogId: workoutLogId,
        routineName: bundle.routineName,
        durationSeconds: durationSeconds,
        exerciseCount: performed.length,
        completedSetCount: sessionSets,
        totalVolumeInUserMs:
            UnitConverter.weightToUserMs(sessionVolume, _ms),
        totalDistanceInUserMs:
            UnitConverter.distanceToUserMs(sessionDistance, _ms),
        prs: prHighlights,
        bodyPartUsage: {
          for (final e in bodyPartUsage.entries) e.key: e.value.score,
        },
      ));
    } catch (e) {
      return Err(e);
    }
  }

  /// In-memory sets are in user units; canonical storage is imperial.
  WorkoutSetDraft _toImperial(WorkoutSetDraft set) {
    if (_ms == MeasurementSystem.us) return set.copy();
    return WorkoutSetDraft(
      weight: set.weight == null
          ? null
          : UnitConverter.weightToImperial(set.weight!, _ms),
      reps: set.reps,
      durationSeconds: set.durationSeconds,
      distance: set.distance == null
          ? null
          : UnitConverter.distanceToImperial(set.distance!, _ms),
      speed: set.speed == null
          ? null
          : UnitConverter.speedToImperial(set.speed!, _ms),
      restTimeSeconds: set.restTimeSeconds,
      isCompleted: set.isCompleted,
    );
  }
}
