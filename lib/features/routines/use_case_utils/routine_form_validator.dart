import '../../../core/constants/config_constants.dart';
import '../../common/models/result.dart';
import '../models/models_dto/routine_draft.dart';

abstract final class RoutineFormValidator {
  static Result<void> validate(String name, List<RoutineExerciseDraft> drafts) {
    if (name.trim().isEmpty) return const Err('Give the routine a name.');
    if (name.trim().length > 60) {
      return const Err('Routine names are limited to 60 characters.');
    }
    if (drafts.isEmpty) return const Err('Add at least one exercise.');
    if (drafts.length > ConfigConstants.maxExercisesPerRoutine) {
      return Err('Routines are limited to '
          '${ConfigConstants.maxExercisesPerRoutine} exercises.');
    }
    return const Ok(null);
  }
}
