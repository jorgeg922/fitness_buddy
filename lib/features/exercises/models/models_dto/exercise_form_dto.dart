import '../../../../core/taxonomy/body_part.dart';
import '../../../../core/taxonomy/cardio_modality.dart';
import '../../../../core/taxonomy/exercise_category.dart';
import '../../../../core/taxonomy/strength_modality.dart';

/// Raw form capture for creating/editing a custom exercise.
class ExerciseFormDto {
  const ExerciseFormDto({
    required this.userId,
    required this.name,
    required this.category,
    required this.bodyPart,
    this.strengthModality,
    this.cardioModality,
    this.notes,
    this.existingUserExerciseId,
  });

  final String userId;
  final String name;
  final ExerciseCategory category;
  final BodyPart bodyPart;
  final StrengthModality? strengthModality;
  final CardioModality? cardioModality;
  final String? notes;

  /// Non-null when editing.
  final String? existingUserExerciseId;
}
