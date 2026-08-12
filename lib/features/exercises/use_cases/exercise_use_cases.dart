import 'package:uuid/uuid.dart';

import '../../common/models/result.dart';
import '../models/models_dto/exercise_form_dto.dart';
import '../services/write/exercise_repository.dart';
import '../use_case_utils/exercise_form_validator.dart';

/// The write gate for the exercises feature: validate → map → persist.
class ExerciseUseCases {
  ExerciseUseCases(this._repo);

  final ExerciseRepository _repo;

  Future<Result<String>> executeCreate(ExerciseFormDto dto) async {
    final v = ExerciseFormValidator.validate(dto);
    if (v.isErr) return Err(v.error);
    try {
      const uuid = Uuid();
      final userExerciseId = uuid.v4();
      await _repo.createCustomExercise(
        exerciseId: uuid.v4(),
        userExerciseId: userExerciseId,
        userId: dto.userId,
        name: dto.name.trim(),
        category: dto.category,
        bodyPartName: dto.bodyPart.name,
        strengthModality: dto.strengthModality,
        cardioModality: dto.cardioModality,
        notes: _normalizeNotes(dto.notes),
      );
      return Ok(userExerciseId);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<void>> executeUpdate(
      ExerciseFormDto dto, String exerciseId) async {
    final v = ExerciseFormValidator.validate(dto);
    if (v.isErr) return Err(v.error);
    final userExerciseId = dto.existingUserExerciseId;
    if (userExerciseId == null) {
      return const Err('Missing exercise reference.');
    }
    try {
      await _repo.updateCustomExercise(
        exerciseId: exerciseId,
        userExerciseId: userExerciseId,
        name: dto.name.trim(),
        bodyPartName: dto.bodyPart.name,
        strengthModality: dto.strengthModality,
        cardioModality: dto.cardioModality,
        notes: _normalizeNotes(dto.notes),
      );
      return const Ok(null);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<void>> executeDelete(String userExerciseId) async {
    try {
      await _repo.softDelete(userExerciseId);
      return const Ok(null);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<void>> toggleFavorite(
      String userExerciseId, bool isFavorite) async {
    try {
      await _repo.setFavorite(userExerciseId, isFavorite);
      return const Ok(null);
    } catch (e) {
      return Err(e);
    }
  }

  Future<Result<void>> updateNotes(String userExerciseId, String? notes) async {
    try {
      await _repo.updateNotes(userExerciseId, _normalizeNotes(notes));
      return const Ok(null);
    } catch (e) {
      return Err(e);
    }
  }

  String? _normalizeNotes(String? notes) {
    final trimmed = notes?.trim();
    return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
  }
}
