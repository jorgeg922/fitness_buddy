import 'display_metrics.dart';
import 'tracked_metrics.dart';

enum CardioModality {
  endurance(
    label: 'Endurance',
    supportedMetrics: {
      TrackedMetrics.distance,
      TrackedMetrics.duration,
      TrackedMetrics.speed,
    },
    supportedMetricsPr: {
      TrackedMetricsPr.maxDistance,
      TrackedMetricsPr.maxSpeed,
      TrackedMetricsPr.maxDuration,
    },
    supportedDisplayMetrics: {
      DisplayMetrics.totalDistance,
      DisplayMetrics.totalDuration,
      DisplayMetrics.avgSpeed,
      DisplayMetrics.maxSpeed,
      DisplayMetrics.distanceVsDuration,
    },
  ),
  bodyweight(
    label: 'Bodyweight',
    supportedMetrics: {TrackedMetrics.reps, TrackedMetrics.duration},
    supportedMetricsPr: {TrackedMetricsPr.maxRepsSet},
    supportedDisplayMetrics: {
      DisplayMetrics.totalReps,
      DisplayMetrics.totalDuration,
      DisplayMetrics.setCount,
    },
  ),
  plyometrics(
    label: 'Plyometrics',
    supportedMetrics: {TrackedMetrics.reps, TrackedMetrics.duration},
    supportedMetricsPr: {TrackedMetricsPr.maxRepsSet},
    supportedDisplayMetrics: {
      DisplayMetrics.totalReps,
      DisplayMetrics.totalDuration,
      DisplayMetrics.setCount,
    },
  ),
  calisthenics(
    label: 'Calisthenics',
    supportedMetrics: {TrackedMetrics.reps, TrackedMetrics.duration},
    supportedMetricsPr: {TrackedMetricsPr.maxRepsSet},
    supportedDisplayMetrics: {
      DisplayMetrics.totalReps,
      DisplayMetrics.totalDuration,
      DisplayMetrics.setCount,
    },
  ),
  intervals(
    label: 'Intervals',
    supportedMetrics: {TrackedMetrics.duration, TrackedMetrics.reps},
    supportedMetricsPr: {TrackedMetricsPr.maxDuration},
    supportedDisplayMetrics: {
      DisplayMetrics.totalDuration,
      DisplayMetrics.setCount,
    },
  );

  const CardioModality({
    required this.label,
    required this.supportedMetrics,
    required this.supportedMetricsPr,
    required this.supportedDisplayMetrics,
  });

  final String label;
  final Set<TrackedMetrics> supportedMetrics;
  final Set<TrackedMetricsPr> supportedMetricsPr;
  final Set<DisplayMetrics> supportedDisplayMetrics;

  /// Cardio never auto-progresses.
  bool get supportsAutoIncrement => false;

  static CardioModality? tryParse(String? name) =>
      name == null ? null : CardioModality.values.asNameMap()[name];
}
