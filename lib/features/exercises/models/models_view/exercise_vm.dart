import 'package:equatable/equatable.dart';

import '../../../../core/data/dao/exercise_dao.dart';
import '../../../../core/taxonomy/body_part.dart';
import '../../../../core/taxonomy/cardio_modality.dart';
import '../../../../core/taxonomy/exercise_category.dart';
import '../../../../core/taxonomy/strength_modality.dart';

/// Denormalized, display-ready exercise row. `id` is the USER-exercise id —
/// the FK everything downstream uses.
class ExerciseVm extends Equatable {
  const ExerciseVm({
    required this.id,
    required this.exerciseId,
    required this.name,
    required this.category,
    required this.bodyPart,
    required this.modalityLabel,
    required this.isFavorite,
    required this.isCustom,
    required this.supportsAutoIncrement,
    this.strengthModality,
    this.cardioModality,
    this.lastPerformedAt,
    this.notes,
  });

  final String id;
  final String exerciseId;
  final String name;
  final ExerciseCategory category;
  final BodyPart bodyPart;
  final String modalityLabel;
  final bool isFavorite;
  final bool isCustom;
  final bool supportsAutoIncrement;
  final StrengthModality? strengthModality;
  final CardioModality? cardioModality;
  final int? lastPerformedAt;
  final String? notes;

  @override
  List<Object?> get props => [
        id,
        exerciseId,
        name,
        category,
        bodyPart,
        modalityLabel,
        isFavorite,
        isCustom,
        lastPerformedAt,
        notes,
      ];
}

extension UserExerciseJoinedRowVm on UserExerciseJoinedRow {
  ExerciseVm toVm() {
    final category = ExerciseCategory.parse(exercise.category);
    final strength = StrengthModality.tryParse(strengthProfile?.strengthModality);
    final cardio = CardioModality.tryParse(cardioProfile?.cardioModality);
    return ExerciseVm(
      id: userExercise.id,
      exerciseId: exercise.id,
      name: exercise.name,
      category: category,
      bodyPart: BodyPart.parse(exercise.bodyPart),
      modalityLabel: strength?.label ?? cardio?.label ?? category.label,
      isFavorite: userExercise.isFavorite,
      isCustom: exercise.ownerUserId != null,
      supportsAutoIncrement: strength?.supportsAutoIncrement ?? false,
      strengthModality: strength,
      cardioModality: cardio,
      lastPerformedAt: userExercise.lastPerformedAt,
      notes: userExercise.notes,
    );
  }
}
