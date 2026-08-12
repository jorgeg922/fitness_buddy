/// In-memory state of the routine builder — what the user is editing before
/// a save produces a merge diff.
class RoutineExerciseDraft {
  const RoutineExerciseDraft({
    required this.userExerciseId,
    required this.name,
    this.instanceId,
    this.notes,
  });

  /// Null for freshly added exercises; set for rows loaded from the DB.
  final String? instanceId;
  final String userExerciseId;
  final String name;
  final String? notes;

  RoutineExerciseDraft copyWith({String? notes}) => RoutineExerciseDraft(
        instanceId: instanceId,
        userExerciseId: userExerciseId,
        name: name,
        notes: notes ?? this.notes,
      );
}
