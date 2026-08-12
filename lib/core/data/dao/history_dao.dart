import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/exercise_performance_log_table.dart';
import '../tables/exercise_table.dart';
import '../tables/set_log_table.dart';
import '../tables/user_exercise_table.dart';
import '../tables/workout_log_table.dart';

part 'history_dao.g.dart';

/// One recent performance with its display name and logged sets — feeds the
/// home "Recent exercises" card.
class RecentPerformance {
  RecentPerformance({
    required this.userExerciseId,
    required this.exerciseName,
    required this.performedAt,
    required this.sets,
  });

  final String userExerciseId;
  final String exerciseName;
  final int performedAt;
  final List<SetLogRow> sets;
}

@DriftAccessor(tables: [
  WorkoutLogTable,
  ExercisePerformanceLogTable,
  SetLogTable,
  UserExerciseTable,
  ExerciseTable,
])
class HistoryDao extends DatabaseAccessor<AppDatabase> with _$HistoryDaoMixin {
  HistoryDao(super.db);

  /// Latest performed exercises across all sessions, newest first, with
  /// their sets resolved.
  Future<List<RecentPerformance>> getRecentPerformances(String userId,
      {int limit = 8}) async {
    final rows = await (select(exercisePerformanceLogTable).join([
      innerJoin(
          userExerciseTable,
          userExerciseTable.id
              .equalsExp(exercisePerformanceLogTable.userExerciseId)),
      innerJoin(exerciseTable,
          exerciseTable.id.equalsExp(userExerciseTable.exerciseId)),
    ])
          ..where(exercisePerformanceLogTable.userId.equals(userId))
          ..orderBy([
            OrderingTerm.desc(exercisePerformanceLogTable.performedAt),
            OrderingTerm.desc(exercisePerformanceLogTable.id),
          ])
          ..limit(limit))
        .get();

    final result = <RecentPerformance>[];
    for (final row in rows) {
      final performance = row.readTable(exercisePerformanceLogTable);
      result.add(RecentPerformance(
        userExerciseId: performance.userExerciseId,
        exerciseName: row.readTable(exerciseTable).name,
        performedAt: performance.performedAt,
        sets: await getSetsForPerformance(performance.id),
      ));
    }
    return result;
  }

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
