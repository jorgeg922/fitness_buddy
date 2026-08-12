import 'package:drift/drift.dart';

import '../../../../core/data/database.dart';
import '../../../../core/taxonomy/body_part.dart';
import '../../models/models_view/routine_vm.dart';

/// Read side. One joined watch produces the full routine list with ordered
/// exercise instances — the routines tab and builder both feed off it.
class RoutineQueryRepository {
  RoutineQueryRepository(this._db);

  final AppDatabase _db;

  Stream<List<RoutineVm>> watchRoutines(String userId) {
    final query = _db.select(_db.routineTable).join([
      leftOuterJoin(
        _db.routineExerciseTable,
        _db.routineExerciseTable.routineId.equalsExp(_db.routineTable.id),
      ),
      leftOuterJoin(
        _db.userExerciseTable,
        _db.userExerciseTable.id
            .equalsExp(_db.routineExerciseTable.userExerciseId),
      ),
      leftOuterJoin(
        _db.exerciseTable,
        _db.exerciseTable.id.equalsExp(_db.userExerciseTable.exerciseId),
      ),
    ])
      ..where(_db.routineTable.userId.equals(userId));

    return query.watch().map((rows) {
      final byRoutine = <String, RoutineRow>{};
      final exercisesByRoutine = <String, List<RoutineExerciseVm>>{};

      for (final row in rows) {
        final routine = row.readTable(_db.routineTable);
        byRoutine[routine.id] = routine;
        final instance = row.readTableOrNull(_db.routineExerciseTable);
        final exercise = row.readTableOrNull(_db.exerciseTable);
        if (instance == null || exercise == null) continue;
        exercisesByRoutine.putIfAbsent(routine.id, () => []).add(
              RoutineExerciseVm(
                instanceId: instance.id,
                userExerciseId: instance.userExerciseId,
                name: exercise.name,
                bodyPart: BodyPart.parse(exercise.bodyPart),
                position: instance.exPosition,
                notes: instance.notes,
              ),
            );
      }

      final routines = byRoutine.values.map((routine) {
        final exercises = (exercisesByRoutine[routine.id] ?? [])
          ..sort((a, b) => a.position.compareTo(b.position));
        return RoutineVm(
          id: routine.id,
          name: routine.name,
          isFavorite: routine.isFavorite,
          lastCompletedAt: routine.lastCompletedAt,
          exercises: exercises,
        );
      }).toList()
        ..sort((a, b) {
          if (a.isFavorite != b.isFavorite) return a.isFavorite ? -1 : 1;
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
      return routines;
    });
  }

  Future<List<RoutineExerciseRow>> getRoutineExerciseRows(String routineId) =>
      _db.routineDao.getRoutineExercises(routineId);

  Future<Set<String>> getRoutineNames(String userId) async {
    final rows = await (_db.select(_db.routineTable)
          ..where((t) => t.userId.equals(userId)))
        .get();
    return rows.map((r) => r.name).toSet();
  }
}
