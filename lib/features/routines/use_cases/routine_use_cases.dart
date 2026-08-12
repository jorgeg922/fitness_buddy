import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../core/data/database.dart';
import '../../common/models/result.dart';
import '../models/models_dto/routine_draft.dart';
import '../models/models_view/routine_vm.dart';
import '../services/read/routine_query_repository.dart';
import '../services/write/routine_repository.dart';
import '../use_case_utils/routine_form_validator.dart';
import '../use_case_utils/routine_input_mapper.dart';

class RoutineUseCases {
  RoutineUseCases(this._repo, this._queryRepo);

  final RoutineRepository _repo;
  final RoutineQueryRepository _queryRepo;

  Future<Result<String>> executeCreate({
    required String userId,
    required String name,
    required List<RoutineExerciseDraft> drafts,
  }) async {
    final v = RoutineFormValidator.validate(name, drafts);
    if (v.isErr) return Err(v.error);
    try {
      final routineId = const Uuid().v4();
      final diff = RoutineInputMapper.computeMergeDiff(
        userId: userId,
        routineId: routineId,
        existing: const [],
        drafts: drafts,
      );
      await _repo.createRoutine(
        routineId: routineId,
        userId: userId,
        name: name.trim(),
        exercises: diff.toInsert,
      );
      return Ok(routineId);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<void>> executeUpdate({
    required String userId,
    required String routineId,
    required String name,
    required List<RoutineExerciseDraft> drafts,
  }) async {
    final v = RoutineFormValidator.validate(name, drafts);
    if (v.isErr) return Err(v.error);
    try {
      final existing = await _queryRepo.getRoutineExerciseRows(routineId);
      final diff = RoutineInputMapper.computeMergeDiff(
        userId: userId,
        routineId: routineId,
        existing: existing,
        drafts: drafts,
      );
      await _repo.applyMergeDiff(
          routineId: routineId, name: name.trim(), diff: diff);
      return const Ok(null);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<String>> executeDuplicate(
      String userId, RoutineVm source) async {
    try {
      final names = await _queryRepo.getRoutineNames(userId);
      final newName = RoutineInputMapper.duplicateName(source.name, names);
      final routineId = const Uuid().v4();
      const uuid = Uuid();
      await _repo.createRoutine(
        routineId: routineId,
        userId: userId,
        name: newName,
        exercises: [
          for (final e in source.exercises)
            RoutineExerciseTableCompanion.insert(
              id: uuid.v4(),
              userId: userId,
              routineId: routineId,
              userExerciseId: e.userExerciseId,
              exPosition: e.position,
              notes: Value(e.notes),
            ),
        ],
      );
      return Ok(routineId);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<void>> executeDelete(String routineId) async {
    try {
      await _repo.deleteRoutine(routineId);
      return const Ok(null);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<void>> toggleFavorite(
      String routineId, bool isFavorite) async {
    try {
      await _repo.setFavorite(routineId, isFavorite);
      return const Ok(null);
    } catch (e) {
      return Err(e);
    }
  }
}
