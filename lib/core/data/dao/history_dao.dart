import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/exercise_performance_log_table.dart';
import '../tables/set_log_table.dart';
import '../tables/workout_log_table.dart';

part 'history_dao.g.dart';

@DriftAccessor(
    tables: [WorkoutLogTable, ExercisePerformanceLogTable, SetLogTable])
class HistoryDao extends DatabaseAccessor<AppDatabase> with _$HistoryDaoMixin {
  HistoryDao(super.db);

  /// The change-tick: expensive stats FutureProviders watch this count and
  /// re-run after every finished workout instead of holding live joins open.
  Stream<int> watchWorkoutChanges(String userId) {
    final countExp = workoutLogTable.id.count();
    final q = selectOnly(workoutLogTable)
      ..addColumns([countExp])
      ..where(workoutLogTable.userId.equals(userId));
    return q.watchSingle().map((row) => row.read(countExp) ?? 0);
  }

  Future<void> insertWorkoutLog(WorkoutLogTableCompanion row) =>
      into(workoutLogTable).insert(row);

  Future<void> insertPerformanceLog(
          ExercisePerformanceLogTableCompanion row) =>
      into(exercisePerformanceLogTable).insert(row);

  Future<void> insertSetLogs(List<SetLogTableCompanion> rows) =>
      batch((b) => b.insertAll(setLogTable, rows));

  Stream<List<WorkoutLogRow>> watchWorkoutLogs(String userId,
          {int limit = 50}) =>
      (select(workoutLogTable)
            ..where((t) => t.userId.equals(userId))
            ..orderBy([(t) => OrderingTerm.desc(t.performedAt)])
            ..limit(limit))
          .watch();

  Future<List<ExercisePerformanceLogRow>> getPerformancesForWorkout(
          String workoutLogId) =>
      (select(exercisePerformanceLogTable)
            ..where((t) => t.workoutLogId.equals(workoutLogId)))
          .get();

  Future<List<SetLogRow>> getSetsForPerformance(String performanceLogId) =>
      (select(setLogTable)
            ..where((t) => t.exercisePerformanceLogId.equals(performanceLogId))
            ..orderBy([(t) => OrderingTerm.asc(t.setNumber)]))
          .get();

  /// Latest performance of an exercise with its sets — powers set
  /// prepopulation and the "previous" display in the execution screen.
  Future<ExercisePerformanceLogRow?> getLatestPerformance(
          String userExerciseId) =>
      (select(exercisePerformanceLogTable)
            ..where((t) => t.userExerciseId.equals(userExerciseId))
            ..orderBy([(t) => OrderingTerm.desc(t.performedAt)])
            ..limit(1))
          .getSingleOrNull();

  Future<List<ExercisePerformanceLogRow>> getPerformancesPage(
          String userExerciseId, {required int limit, required int offset}) =>
      (select(exercisePerformanceLogTable)
            ..where((t) => t.userExerciseId.equals(userExerciseId))
            ..orderBy([(t) => OrderingTerm.desc(t.performedAt)])
            ..limit(limit, offset: offset))
          .get();
}
