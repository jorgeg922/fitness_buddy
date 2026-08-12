import 'dart:math' as math;

import 'package:drift/drift.dart';

import '../../../core/data/database.dart';
import '../../../core/taxonomy/tracked_metrics.dart';
import '../../workout_execution/models/models_dto/workout_set_draft.dart';

/// Per-exercise numbers for one session, computed from IMPERIAL sets.
class ExerciseSessionStats {
  const ExerciseSessionStats({
    required this.setCount,
    required this.totalVolume,
    required this.totalReps,
    this.maxWeight,
    this.minWeight,
    this.oneRepMax,
    this.totalDurationSeconds,
    this.totalDistance,
    this.maxSpeed,
    this.avgSpeed,
    this.maxReps,
  });

  final int setCount;
  final double totalVolume;
  final int totalReps;
  final double? maxWeight;
  final double? minWeight;
  final double? oneRepMax;
  final int? totalDurationSeconds;
  final double? totalDistance;
  final double? maxSpeed;
  final double? avgSpeed;
  final int? maxReps;
}

/// A PR detected against the lifetime aggregate.
class DetectedPr {
  const DetectedPr({
    required this.metric,
    required this.metricLabel,
    required this.value,
    this.previousValue,
  });

  /// TrackedMetricsPr.name, stored in the PR event row.
  final String metric;
  final String metricLabel;
  final double value;
  final double? previousValue;
}

/// Pure computation over completed sets (doc §8.4 step 5). No I/O — the
/// finish use case preloads current rows and persists the outputs in its
/// single transaction. All inputs/outputs are canonical imperial.
abstract final class StatisticsService {
  static ExerciseSessionStats computeSessionStats(
      List<WorkoutSetDraft> sets, double volumeMultiplier) {
    var totalVolume = 0.0;
    var totalReps = 0;
    double? maxWeight;
    double? minWeight;
    double? oneRepMax;
    int? totalDuration;
    double? totalDistance;
    double? maxSpeed;
    int? maxReps;

    for (final set in sets) {
      final weight = set.weight;
      final reps = set.reps;
      if (weight != null && reps != null) {
        totalVolume += weight * reps * volumeMultiplier;
        // Epley estimate, only meaningful for real working sets.
        final epley = weight * (1 + reps / 30.0);
        oneRepMax = math.max(oneRepMax ?? 0, epley);
      }
      if (weight != null) {
        maxWeight = math.max(maxWeight ?? double.negativeInfinity, weight);
        minWeight = math.min(minWeight ?? double.infinity, weight);
      }
      if (reps != null) {
        totalReps += reps;
        maxReps = math.max(maxReps ?? 0, reps);
      }
      if (set.durationSeconds != null) {
        totalDuration = (totalDuration ?? 0) + set.durationSeconds!;
      }
      if (set.distance != null) {
        totalDistance = (totalDistance ?? 0) + set.distance!;
      }
      if (set.speed != null) {
        maxSpeed = math.max(maxSpeed ?? 0, set.speed!);
      }
    }

    double? avgSpeed;
    if (totalDistance != null && (totalDuration ?? 0) > 0) {
      avgSpeed = totalDistance / (totalDuration! / 3600.0);
    }

    return ExerciseSessionStats(
      setCount: sets.length,
      totalVolume: totalVolume,
      totalReps: totalReps,
      maxWeight: maxWeight,
      minWeight: minWeight,
      oneRepMax: oneRepMax,
      totalDurationSeconds: totalDuration,
      totalDistance: totalDistance,
      maxSpeed: maxSpeed,
      avgSpeed: avgSpeed,
      maxReps: maxReps,
    );
  }

  /// Merges a session's numbers into the day's rollup row (same exercise
  /// trained twice in a day accumulates).
  static HistoryStatsRollupTableCompanion mergeRollup({
    required String userId,
    required String userExerciseId,
    required int dayEpoch,
    required ExerciseSessionStats stats,
    HistoryStatsRollupRow? existing,
  }) {
    double? maxN(double? a, double? b) =>
        a == null ? b : (b == null ? a : math.max(a, b));
    double? minN(double? a, double? b) =>
        a == null ? b : (b == null ? a : math.min(a, b));

    return HistoryStatsRollupTableCompanion.insert(
      userId: userId,
      userExerciseId: userExerciseId,
      dayEpoch: dayEpoch,
      setCount: Value((existing?.setCount ?? 0) + stats.setCount),
      totalVolume: Value((existing?.totalVolume ?? 0) + stats.totalVolume),
      totalReps: Value((existing?.totalReps ?? 0) + stats.totalReps),
      maxWeight: Value(maxN(existing?.maxWeight, stats.maxWeight)),
      minWeight: Value(minN(existing?.minWeight, stats.minWeight)),
      oneRepMax: Value(maxN(existing?.oneRepMax, stats.oneRepMax)),
      totalDurationSeconds: Value(stats.totalDurationSeconds == null
          ? existing?.totalDurationSeconds
          : (existing?.totalDurationSeconds ?? 0) +
              stats.totalDurationSeconds!),
      totalDistance: Value(stats.totalDistance == null
          ? existing?.totalDistance
          : (existing?.totalDistance ?? 0) + stats.totalDistance!),
      maxSpeed: Value(maxN(existing?.maxSpeed, stats.maxSpeed)),
      avgSpeed: Value(stats.avgSpeed ?? existing?.avgSpeed),
    );
  }

  /// PRs are only detected for metrics the modality declares PR-able.
  static List<DetectedPr> detectPrs({
    required ExerciseSessionStats stats,
    required Set<TrackedMetricsPr> supported,
    ExerciseOverallAggregateRow? aggregate,
  }) {
    final prs = <DetectedPr>[];

    void check(TrackedMetricsPr metric, double? candidate, double? previous) {
      if (candidate == null || candidate <= 0) return;
      if (!supported.contains(metric)) return;
      if (previous != null && candidate <= previous) return;
      prs.add(DetectedPr(
        metric: metric.name,
        metricLabel: metric.label,
        value: candidate,
        previousValue: previous,
      ));
    }

    check(TrackedMetricsPr.maxWeight, stats.maxWeight, aggregate?.pbMaxWeight);
    check(TrackedMetricsPr.oneRepMax, stats.oneRepMax, aggregate?.pbOneRepMax);
    check(TrackedMetricsPr.maxRepsSet, stats.maxReps?.toDouble(),
        aggregate?.pbMaxRepsSet?.toDouble());
    check(TrackedMetricsPr.maxVolumeSession, stats.totalVolume,
        aggregate?.pbMaxVolumeSession);
    check(TrackedMetricsPr.maxDistance, stats.totalDistance,
        aggregate?.pbMaxDistance);
    check(TrackedMetricsPr.maxSpeed, stats.maxSpeed, aggregate?.pbMaxSpeed);
    check(TrackedMetricsPr.maxDuration,
        stats.totalDurationSeconds?.toDouble(),
        aggregate?.pbMaxDurationSeconds?.toDouble());

    return prs;
  }

  static ExerciseOverallAggregateTableCompanion mergeAggregate({
    required String userId,
    required String userExerciseId,
    required int performedAt,
    required ExerciseSessionStats stats,
    ExerciseOverallAggregateRow? existing,
  }) {
    double? maxN(double? a, double? b) =>
        a == null ? b : (b == null ? a : math.max(a, b));

    return ExerciseOverallAggregateTableCompanion.insert(
      userExerciseId: userExerciseId,
      userId: userId,
      timesCompleted: Value((existing?.timesCompleted ?? 0) + 1),
      firstCompletedOn: Value(existing?.firstCompletedOn ?? performedAt),
      lastCompletedOn: Value(performedAt),
      totalVolume: Value((existing?.totalVolume ?? 0) + stats.totalVolume),
      totalReps: Value((existing?.totalReps ?? 0) + stats.totalReps),
      totalSets: Value((existing?.totalSets ?? 0) + stats.setCount),
      totalDurationSeconds: Value((existing?.totalDurationSeconds ?? 0) +
          (stats.totalDurationSeconds ?? 0)),
      totalDistance:
          Value((existing?.totalDistance ?? 0) + (stats.totalDistance ?? 0)),
      pbMaxWeight: Value(maxN(existing?.pbMaxWeight, stats.maxWeight)),
      pbOneRepMax: Value(maxN(existing?.pbOneRepMax, stats.oneRepMax)),
      pbMaxRepsSet: Value(stats.maxReps == null
          ? existing?.pbMaxRepsSet
          : math.max(existing?.pbMaxRepsSet ?? 0, stats.maxReps!)),
      pbMaxVolumeSession: Value(
          maxN(existing?.pbMaxVolumeSession, stats.totalVolume)),
      pbMaxDistance: Value(maxN(existing?.pbMaxDistance, stats.totalDistance)),
      pbMaxSpeed: Value(maxN(existing?.pbMaxSpeed, stats.maxSpeed)),
      pbMaxDurationSeconds: Value(stats.totalDurationSeconds == null
          ? existing?.pbMaxDurationSeconds
          : math.max(existing?.pbMaxDurationSeconds ?? 0,
              stats.totalDurationSeconds!)),
    );
  }
}
