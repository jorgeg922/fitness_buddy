/// One editable set row in the live workout. Values are in the USER's unit
/// system while in memory; conversion to canonical imperial happens once in
/// the finish pipeline. Serialized into the draft table's payload JSON.
class WorkoutSetDraft {
  WorkoutSetDraft({
    this.weight,
    this.reps,
    this.durationSeconds,
    this.distance,
    this.speed,
    this.restTimeSeconds,
    this.isCompleted = false,
  });

  double? weight;
  int? reps;
  int? durationSeconds;
  double? distance;
  double? speed;
  int? restTimeSeconds;
  bool isCompleted;

  factory WorkoutSetDraft.fromJson(Map<String, dynamic> json) =>
      WorkoutSetDraft(
        weight: (json['weight'] as num?)?.toDouble(),
        reps: json['reps'] as int?,
        durationSeconds: json['duration_seconds'] as int?,
        distance: (json['distance'] as num?)?.toDouble(),
        speed: (json['speed'] as num?)?.toDouble(),
        restTimeSeconds: json['rest_time_seconds'] as int?,
        isCompleted: json['is_completed'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'weight': weight,
        'reps': reps,
        'duration_seconds': durationSeconds,
        'distance': distance,
        'speed': speed,
        'rest_time_seconds': restTimeSeconds,
        'is_completed': isCompleted,
      };

  WorkoutSetDraft copy() => WorkoutSetDraft(
        weight: weight,
        reps: reps,
        durationSeconds: durationSeconds,
        distance: distance,
        speed: speed,
        restTimeSeconds: restTimeSeconds,
        isCompleted: isCompleted,
      );

  /// A set counts toward history only when completed and it carries at least
  /// one metric value.
  bool get hasAnyValue =>
      (weight ?? 0) > 0 ||
      (reps ?? 0) > 0 ||
      (durationSeconds ?? 0) > 0 ||
      (distance ?? 0) > 0;
}

/// Payload stored per exercise in active_workout_draft_table.
class ExerciseDraftPayload {
  ExerciseDraftPayload({
    required this.sets,
    this.isSkipped = false,
    this.isCompleted = false,
  });

  final List<WorkoutSetDraft> sets;
  bool isSkipped;
  bool isCompleted;

  factory ExerciseDraftPayload.fromJson(Map<String, dynamic> json) =>
      ExerciseDraftPayload(
        sets: ((json['sets'] as List?) ?? [])
            .cast<Map<String, dynamic>>()
            .map(WorkoutSetDraft.fromJson)
            .toList(),
        isSkipped: json['is_skipped'] as bool? ?? false,
        isCompleted: json['is_completed'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
        'sets': sets.map((s) => s.toJson()).toList(),
        'is_skipped': isSkipped,
        'is_completed': isCompleted,
      };
}
