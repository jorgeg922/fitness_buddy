import 'dart:math' as math;

import '../../../core/taxonomy/body_part.dart';
import '../models/muscle_mapping.dart';

/// Pure math: body-part usage scores → per-muscle Rive intensities (0..4).
///
/// Normalization is RELATIVE — the hardest-hit muscle in the window pins 4.0
/// so the figure always shows contrast whether the user logged 3 sets or 300.
/// sqrt compression keeps secondary muscles visible instead of everything
/// but the top muscle sitting near zero.
abstract final class HeatmapIntensityService {
  /// [usageScores]: BodyPart → summed score over the window (from
  /// muscle_usage_daily rows). Returns muscle key → 0..4.
  static Map<String, double> intensitiesFromUsage(
      Map<BodyPart, double> usageScores) {
    final muscleScores = <String, double>{};
    for (final entry in usageScores.entries) {
      final weights = bodyPartToMuscles[entry.key];
      if (weights == null || entry.value <= 0) continue;
      for (final w in weights.entries) {
        muscleScores[w.key] =
            (muscleScores[w.key] ?? 0) + entry.value * w.value;
      }
    }
    return _normalize(muscleScores);
  }

  /// Static preview for an exercise: primaries glow max, secondaries mid.
  static Map<String, double> previewForBodyPart(BodyPart bodyPart) {
    final weights = bodyPartToMuscles[bodyPart] ?? const {};
    return {
      for (final e in weights.entries) e.key: (4.0 * e.value).clamp(0.0, 4.0),
    };
  }

  static Map<String, double> _normalize(Map<String, double> scores) {
    if (scores.isEmpty) return const {};
    final maxScore = scores.values.reduce(math.max);
    if (maxScore <= 0) return const {};
    return {
      for (final e in scores.entries)
        e.key: 4.0 * math.sqrt(e.value / maxScore),
    };
  }
}
