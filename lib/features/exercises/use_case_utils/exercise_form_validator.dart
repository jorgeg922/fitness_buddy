import '../../../core/taxonomy/exercise_category.dart';
import '../../common/models/result.dart';
import '../models/models_dto/exercise_form_dto.dart';

abstract final class ExerciseFormValidator {
  static Result<void> validate(ExerciseFormDto dto) {
    final name = dto.name.trim();
    if (name.isEmpty) return const Err('Give the exercise a name.');
    if (name.length > 60) {
      return const Err('Exercise names are limited to 60 characters.');
    }
    if (dto.category == ExerciseCategory.strength &&
        dto.strengthModality == null) {
      return const Err('Pick a strength modality.');
    }
    if (dto.category == ExerciseCategory.cardio && dto.cardioModality == null) {
      return const Err('Pick a cardio modality.');
    }
    return const Ok(null);
  }
}
