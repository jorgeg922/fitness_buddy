import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/exercise_overall_aggregate_table.dart';
import '../tables/history_stats_rollup_table.dart';
import '../tables/muscle_usage_daily_table.dart';
import '../tables/personal_record_event_table.dart';
import '../tables/user_overall_stats_table.dart';

part 'stats_dao.g.dart';

@DriftAccessor(tables: [
  HistoryStatsRollupTable,
  ExerciseOverallAggregateTable,
  PersonalRecordEventTable,
  UserOverallStatsTable,
  MuscleUsageDailyTable,
])
class StatsDao extends DatabaseAccessor<AppDatabase> with _$StatsDaoMixin {
  StatsDao(super.db);

  // --- rollups (the chart source) ---

  Future<HistoryStatsRollupRow?> getRollup(
          String userExerciseId, int dayEpoch) =>
      (select(historyStatsRollupTable)
            ..where((t) =>
                t.userExerciseId.equals(userExerciseId) &
                t.dayEpoch.equals(dayEpoch)))
          .getSingleOrNull();

  Future<List<HistoryStatsRollupRow>> getRollupsInRange(
          String userExerciseId, int fromEpoch, int toEpoch) =>
      (select(historyStatsRollupTable)
            ..where((t) =>
                t.userExerciseId.equals(userExerciseId) &
                t.dayEpoch.isBetweenValues(fromEpoch, toEpoch))
            ..orderBy([(t) => OrderingTerm.asc(t.dayEpoch)]))
          .get();

  Future<void> upsertRollup(HistoryStatsRollupTableCompanion row) =>
      into(historyStatsRollupTable).insertOnConflictUpdate(row);

  // --- lifetime aggregates ---

  Future<ExerciseOverallAggregateRow?> getAggregate(String userExerciseId) =>
      (select(exerciseOverallAggregateTable)
            ..where((t) => t.userExerciseId.equals(userExerciseId)))
          .getSingleOrNull();

  Future<void> upsertAggregate(ExerciseOverallAggregateTableCompanion row) =>
      into(exerciseOverallAggregateTable).insertOnConflictUpdate(row);

  // --- PR feed ---

  Future<void> insertPrEvents(List<PersonalRecordEventTableCompanion> rows) =>
      batch((b) => b.insertAll(personalRecordEventTable, rows));

  Future<List<PersonalRecordEventRow>> getRecentPrEvents(String userId,
          {int limit = 20}) =>
      (select(personalRecordEventTable)
            ..where((t) => t.userId.equals(userId))
            ..orderBy([(t) => OrderingTerm.desc(t.achievedAt)])
            ..limit(limit))
          .get();

  // --- user overall ---

  Future<UserOverallStatsRow?> getUserOverallStats(String userId) =>
      (select(userOverallStatsTable)..where((t) => t.userId.equals(userId)))
          .getSingleOrNull();

  Future<void> upsertUserOverallStats(UserOverallStatsTableCompanion row) =>
      into(userOverallStatsTable).insertOnConflictUpdate(row);

  // --- muscle usage (the heatmap source) ---

  Future<MuscleUsageDailyRow?> getMuscleUsage(
          String userId, String bodyPart, int dayEpoch) =>
      (select(muscleUsageDailyTable)
            ..where((t) =>
                t.userId.equals(userId) &
                t.bodyPart.equals(bodyPart) &
                t.dayEpoch.equals(dayEpoch)))
          .getSingleOrNull();

  Future<List<MuscleUsageDailyRow>> getMuscleUsageInRange(
          String userId, int fromEpoch, int toEpoch) =>
      (select(muscleUsageDailyTable)
            ..where((t) =>
                t.userId.equals(userId) &
                t.dayEpoch.isBetweenValues(fromEpoch, toEpoch)))
          .get();

  Future<void> upsertMuscleUsage(MuscleUsageDailyTableCompanion row) =>
      into(muscleUsageDailyTable).insertOnConflictUpdate(row);
}
