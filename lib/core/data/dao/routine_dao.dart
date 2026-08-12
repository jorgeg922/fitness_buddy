import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/routine_exercise_table.dart';
import '../tables/routine_table.dart';

part 'routine_dao.g.dart';

@DriftAccessor(tables: [RoutineTable, RoutineExerciseTable])
class RoutineDao extends DatabaseAccessor<AppDatabase> with _$RoutineDaoMixin {
  RoutineDao(super.db);

  Stream<List<RoutineRow>> watchRoutines(String userId) => (select(routineTable)
        ..where((t) => t.userId.equals(userId))
        ..orderBy([
          (t) => OrderingTerm.desc(t.isFavorite),
          (t) => OrderingTerm.asc(t.name),
        ]))
      .watch();

  Future<RoutineRow?> getRoutine(String id) =>
      (select(routineTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> countRoutines(String userId) async {
    final countExp = routineTable.id.count();
    final q = selectOnly(routineTable)
      ..addColumns([countExp])
      ..where(routineTable.userId.equals(userId));
    final row = await q.getSingle();
    return row.read(countExp) ?? 0;
  }

  Future<List<RoutineExerciseRow>> getRoutineExercises(String routineId) =>
      (select(routineExerciseTable)
            ..where((t) => t.routineId.equals(routineId))
            ..orderBy([(t) => OrderingTerm.asc(t.exPosition)]))
          .get();

  Future<void> upsertRoutine(RoutineTableCompanion row) =>
      into(routineTable).insertOnConflictUpdate(row);

  Future<void> upsertRoutineExercise(RoutineExerciseTableCompanion row) =>
      into(routineExerciseTable).insertOnConflictUpdate(row);

  Future<void> deleteRoutineExercise(String id) =>
      (delete(routineExerciseTable)..where((t) => t.id.equals(id))).go();

  Future<void> deleteRoutine(String id) =>
      (delete(routineTable)..where((t) => t.id.equals(id))).go();

  Future<void> setFavorite(String routineId, bool isFavorite) =>
      (update(routineTable)..where((t) => t.id.equals(routineId)))
          .write(RoutineTableCompanion(isFavorite: Value(isFavorite)));

  Future<void> stampLastCompleted(String routineId, int epochMs) =>
      (update(routineTable)..where((t) => t.id.equals(routineId)))
          .write(RoutineTableCompanion(lastCompletedAt: Value(epochMs)));
}
