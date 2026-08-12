import 'display_metrics.dart';
import 'tracked_metrics.dart';

/// The capability matrix (doc §7): each modality declares what an exercise
/// can do, and forms/PRs/charts key off that. The schema never changes —
/// set_log already has every nullable metric column.
enum StrengthModality {
  bodyweight(
    label: 'Bodyweight',
    supportedMetrics: {TrackedMetrics.reps},
    supportedMetricsPr: {
      TrackedMetricsPr.maxRepsSet,
      TrackedMetricsPr.maxVolumeSession,
    },
    supportedDisplayMetrics: {
      DisplayMetrics.totalReps,
      DisplayMetrics.setCount,
    },
    supportsAutoIncrement: true,
  ),
  weighted(
    label: 'Weighted',
    supportedMetrics: {TrackedMetrics.weight, TrackedMetrics.reps},
    supportedMetricsPr: {
      TrackedMetricsPr.maxWeight,
      TrackedMetricsPr.oneRepMax,
      TrackedMetricsPr.maxRepsSet,
      TrackedMetricsPr.maxVolumeSession,
    },
    supportedDisplayMetrics: {
      DisplayMetrics.totalVolume,
      DisplayMetrics.totalReps,
      DisplayMetrics.setCount,
      DisplayMetrics.maxWeight,
      DisplayMetrics.oneRepMax,
    },
    supportsAutoIncrement: true,
  ),
  assistedBodyweight(
    label: 'Assisted Bodyweight',
    supportedMetrics: {TrackedMetrics.weight, TrackedMetrics.reps},
    supportedMetricsPr: {TrackedMetricsPr.maxRepsSet},
    supportedDisplayMetrics: {
      DisplayMetrics.totalReps,
      DisplayMetrics.setCount,
    },
    supportsAutoIncrement: true,
  ),
  isometric(
    label: 'Isometric',
    supportedMetrics: {TrackedMetrics.duration},
    supportedMetricsPr: {TrackedMetricsPr.maxDuration},
    supportedDisplayMetrics: {
      DisplayMetrics.totalDuration,
      DisplayMetrics.setCount,
    },
    supportsAutoIncrement: true,
  ),
  calisthenics(
    label: 'Calisthenics',
    supportedMetrics: {TrackedMetrics.weight, TrackedMetrics.reps},
    supportedMetricsPr: {
      TrackedMetricsPr.maxRepsSet,
      TrackedMetricsPr.maxWeight,
      TrackedMetricsPr.maxVolumeSession,
    },
    supportedDisplayMetrics: {
      DisplayMetrics.totalReps,
      DisplayMetrics.setCount,
      DisplayMetrics.maxWeight,
      DisplayMetrics.totalVolume,
    },
    supportsAutoIncrement: true,
  ),
  dumbbell(
    label: 'Dumbbell',
    supportedMetrics: {TrackedMetrics.weight, TrackedMetrics.reps},
    supportedMetricsPr: {
      TrackedMetricsPr.maxWeight,
      TrackedMetricsPr.oneRepMax,
      TrackedMetricsPr.maxRepsSet,
      TrackedMetricsPr.maxVolumeSession,
    },
    supportedDisplayMetrics: {
      DisplayMetrics.totalVolume,
      DisplayMetrics.totalReps,
      DisplayMetrics.setCount,
      DisplayMetrics.maxWeight,
      DisplayMetrics.oneRepMax,
    },
    supportsAutoIncrement: true,
  ),
  barbell(
    label: 'Barbell',
    supportedMetrics: {TrackedMetrics.weight, TrackedMetrics.reps},
    supportedMetricsPr: {
      TrackedMetricsPr.maxWeight,
      TrackedMetricsPr.oneRepMax,
      TrackedMetricsPr.maxRepsSet,
      TrackedMetricsPr.maxVolumeSession,
    },
    supportedDisplayMetrics: {
      DisplayMetrics.totalVolume,
      DisplayMetrics.totalReps,
      DisplayMetrics.setCount,
      DisplayMetrics.maxWeight,
      DisplayMetrics.oneRepMax,
    },
    supportsAutoIncrement: true,
  ),
  cables(
    label: 'Cables',
    supportedMetrics: {TrackedMetrics.weight, TrackedMetrics.reps},
    supportedMetricsPr: {
      TrackedMetricsPr.maxWeight,
      TrackedMetricsPr.oneRepMax,
      TrackedMetricsPr.maxRepsSet,
      TrackedMetricsPr.maxVolumeSession,
    },
    supportedDisplayMetrics: {
      DisplayMetrics.totalVolume,
      DisplayMetrics.totalReps,
      DisplayMetrics.setCount,
      DisplayMetrics.maxWeight,
      DisplayMetrics.oneRepMax,
    },
    supportsAutoIncrement: true,
  ),
  resistanceBands(
    label: 'Resistance Bands',
    supportedMetrics: {TrackedMetrics.reps},
    supportedMetricsPr: {TrackedMetricsPr.maxRepsSet},
    supportedDisplayMetrics: {
      DisplayMetrics.totalReps,
      DisplayMetrics.setCount,
    },
    supportsAutoIncrement: true,
  ),
  kettlebell(
    label: 'Kettlebell',
    supportedMetrics: {TrackedMetrics.weight, TrackedMetrics.reps},
    supportedMetricsPr: {
      TrackedMetricsPr.maxWeight,
      TrackedMetricsPr.maxRepsSet,
      TrackedMetricsPr.maxVolumeSession,
    },
    supportedDisplayMetrics: {
      DisplayMetrics.totalVolume,
      DisplayMetrics.totalReps,
      DisplayMetrics.setCount,
      DisplayMetrics.maxWeight,
    },
    supportsAutoIncrement: true,
  );

  const StrengthModality({
    required this.label,
    required this.supportedMetrics,
    required this.supportedMetricsPr,
    required this.supportedDisplayMetrics,
    required this.supportsAutoIncrement,
  });

  final String label;
  final Set<TrackedMetrics> supportedMetrics;
  final Set<TrackedMetricsPr> supportedMetricsPr;
  final Set<DisplayMetrics> supportedDisplayMetrics;
  final bool supportsAutoIncrement;

  bool get tracksWeight => supportedMetrics.contains(TrackedMetrics.weight);

  static StrengthModality? tryParse(String? name) =>
      name == null ? null : StrengthModality.values.asNameMap()[name];
}
