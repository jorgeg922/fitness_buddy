import '../../../core/taxonomy/body_part.dart';

/// One PR surfaced by the finish pipeline, for the summary screen and feed.
class PrHighlight {
  const PrHighlight({
    required this.exerciseName,
    required this.metricLabel,
    required this.value,
    this.previousValue,
  });

  final String exerciseName;
  final String metricLabel;
  final double value;
  final double? previousValue;
}

/// What the post-workout summary screen renders. All display values are in
/// the user's unit system.
class SessionSummary {
  const SessionSummary({
    required this.workoutLogId,
    required this.routineName,
    required this.durationSeconds,
    required this.exerciseCount,
    required this.completedSetCount,
    required this.totalVolumeInUserMs,
    required this.totalDistanceInUserMs,
    required this.prs,
    required this.bodyPartUsage,
  });

  final String workoutLogId;
  final String? routineName;
  final int durationSeconds;
  final int exerciseCount;
  final int completedSetCount;
  final double totalVolumeInUserMs;
  final double totalDistanceInUserMs;
  final List<PrHighlight> prs;

  /// BodyPart → session score; feeds the "muscles hit today" heatmap.
  final Map<BodyPart, double> bodyPartUsage;
}
