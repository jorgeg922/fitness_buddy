import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/active_workout_draft_table.dart';

part 'workout_draft_dao.g.dart';

@DriftAccessor(tables: [ActiveWorkoutDraftTable])
class WorkoutDraftDao extends DatabaseAccessor<AppDatabase>
    with _$WorkoutDraftDaoMixin {
  WorkoutDraftDao(super.db);

  Stream<List<ActiveWorkoutDraftRow>> watchDrafts(String userId) =>
      (select(activeWorkoutDraftTable)..where((t) => t.userId.equals(userId)))
          .watch();

  Future<List<ActiveWorkoutDraftRow>> getDrafts(String userId) =>
      (select(activeWorkoutDraftTable)..where((t) => t.userId.equals(userId)))
          .get();

  /// Upsert keyed on the UNIQUE userExerciseId column.
  Future<void> upsertDraft(ActiveWorkoutDraftTableCompanion row) =>
      into(activeWorkoutDraftTable).insert(
        row,
        onConflict: DoUpdate(
          (_) => row,
          target: [activeWorkoutDraftTable.userExerciseId],
        ),
      );

  Future<void> clearDrafts(String userId) =>
      (delete(activeWorkoutDraftTable)..where((t) => t.userId.equals(userId)))
          .go();
}
