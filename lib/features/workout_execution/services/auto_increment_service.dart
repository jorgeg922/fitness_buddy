import '../../../core/data/database.dart';
import '../models/models_dto/workout_set_draft.dart';

/// Pure progression logic: "add 5 lb every N completions."
///
/// When the policy is enabled and the exercise's completion count has just
/// crossed a multiple of the interval, the prepopulated sets are advanced by
/// the policy deltas. Deltas are stored in imperial; [weightDeltaInUserMs]
/// lets the caller pass a converted value so prepopulated sets stay in the
/// user's unit system.
abstract final class AutoIncrementService {
  static bool shouldAdvance(ProgressionPolicyRow policy, int timesCompleted) {
    if (!policy.autoIncrementEnabled) return false;
    if (timesCompleted <= 0) return false;
    return timesCompleted % policy.autoIncrementInterval == 0;
  }

  static List<WorkoutSetDraft> advance(
    List<WorkoutSetDraft> sets,
    ProgressionPolicyRow policy, {
    required double weightDeltaInUserMs,
    required double distanceDeltaInUserMs,
  }) {
    return [
      for (final set in sets)
        WorkoutSetDraft(
          weight: set.weight == null
              ? null
              : (set.weight! + weightDeltaInUserMs).clamp(0, double.infinity),
          reps: set.reps,
          durationSeconds: set.durationSeconds == null
              ? null
              : set.durationSeconds! + policy.durationDeltaSeconds,
          distance: set.distance == null
              ? null
              : set.distance! + distanceDeltaInUserMs,
          speed: set.speed,
          restTimeSeconds: set.restTimeSeconds,
        ),
    ];
  }
}
