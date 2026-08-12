import '../../../exercises/models/models_view/exercise_vm.dart';
import 'workout_set_draft.dart';

/// Everything the execution screen needs for one exercise, preloaded in a
/// single query pass — the screen never reads the DB again (doc §8.2).
class PreloadedExerciseData {
  const PreloadedExerciseData({
    required this.exercise,
    required this.prepopulatedSets,
    required this.previousSets,
    this.routineExerciseId,
    this.routineNotes,
    this.timesCompleted = 0,
    this.autoIncrementApplied = false,
    this.draftPayload,
  });

  final ExerciseVm exercise;

  /// Sets to seed the form with (last performance, possibly advanced by the
  /// progression policy). User's unit system.
  final List<WorkoutSetDraft> prepopulatedSets;

  /// Read-only "previous" reference display.
  final List<WorkoutSetDraft> previousSets;

  final String? routineExerciseId;
  final String? routineNotes;
  final int timesCompleted;
  final bool autoIncrementApplied;

  /// Non-null when resuming a crashed/backgrounded session.
  final ExerciseDraftPayload? draftPayload;
}

/// Sentinel routine id for single-exercise ad-hoc sessions.
const String adHocRoutineId = 'ad-hoc';

class WorkoutExecutionInputBundle {
  const WorkoutExecutionInputBundle({
    required this.userId,
    required this.routineId,
    required this.exercises,
    this.routineName,
    this.resumedStartedAt,
  });

  final String userId;

  /// A routine id or [adHocRoutineId].
  final String routineId;
  final String? routineName;
  final List<PreloadedExerciseData> exercises;

  /// Original start time when resuming, epoch ms.
  final int? resumedStartedAt;

  bool get isAdhoc => routineId == adHocRoutineId;
}

/// What the execution screen hands the finish pipeline for one exercise.
class CompletedExerciseResult {
  const CompletedExerciseResult({
    required this.data,
    required this.completedSets,
    required this.wasSkipped,
  });

  final PreloadedExerciseData data;

  /// Only completed sets with values, in user units.
  final List<WorkoutSetDraft> completedSets;
  final bool wasSkipped;
}
