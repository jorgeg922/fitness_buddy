import 'package:drift/drift.dart';

import '../../../../core/data/database.dart';
import '../../use_case_utils/routine_input_mapper.dart';

/// Write side: each public method is one transaction.
class RoutineRepository {
  RoutineRepository(this._db);

  final AppDatabase _db;

  Future<void> createRoutine({
    required String routineId,
    required String userId,
    required String name,
    required List<RoutineExerciseTableCompanion> exercises,
  }) {
    return _db.transaction(() async {
      await _db.routineDao.upsertRoutine(RoutineTableCompanion.insert(
        id: routineId,
        userId: userId,
        name: name,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      ));
      for (final row in exercises) {
        await _db.routineDao.upsertRoutineExercise(row);
      }
    });
  }

  Future<void> applyMergeDiff({
    required String routineId,
    required String name,
    required RoutineMergeDto diff,
  }) {
    return _db.transaction(() async {
      await (_db.update(_db.routineTable)
            ..where((t) => t.id.equals(routineId)))
          .write(RoutineTableCompanion(name: Value(name)));
      for (final id in diff.toDelete) {
        await _db.routineDao.deleteRoutineExercise(id);
      }
      for (final row in diff.toUpdate) {
        await (_db.update(_db.routineExerciseTable)
              ..where((t) => t.id.equals(row.id.value)))
            .write(row);
      }
      for (final row in diff.toInsert) {
        await _db.routineDao.upsertRoutineExercise(row);
      }
    });
  }

  Future<void> deleteRoutine(String routineId) =>
      _db.routineDao.deleteRoutine(routineId);

  Future<void> setFavorite(String routineId, bool isFavorite) =>
      _db.routineDao.setFavorite(routineId, isFavorite);
}
