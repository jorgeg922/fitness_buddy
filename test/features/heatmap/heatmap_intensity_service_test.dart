import 'dart:math' as math;

import 'package:fitness_buddy/core/taxonomy/body_part.dart';
import 'package:fitness_buddy/features/heatmap/services/heatmap_intensity_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty usage produces no intensities', () {
    expect(HeatmapIntensityService.intensitiesFromUsage({}), isEmpty);
    expect(
        HeatmapIntensityService.intensitiesFromUsage(
            {BodyPart.chest: 0, BodyPart.back: -1}),
        isEmpty);
  });

  test('single body part pins its primary mover at 4.0', () {
    final result =
        HeatmapIntensityService.intensitiesFromUsage({BodyPart.chest: 12});
    expect(result['pectoralisMajor'], closeTo(4.0, 1e-9));
  });

  test('normalization is relative — scale invariance', () {
    final small = HeatmapIntensityService.intensitiesFromUsage(
        {BodyPart.chest: 3, BodyPart.biceps: 1.5});
    final large = HeatmapIntensityService.intensitiesFromUsage(
        {BodyPart.chest: 300, BodyPart.biceps: 150});
    for (final key in small.keys) {
      expect(small[key], closeTo(large[key]!, 1e-9));
    }
  });

  test('sqrt compression keeps secondaries visible', () {
    final result = HeatmapIntensityService.intensitiesFromUsage(
        {BodyPart.chest: 16, BodyPart.biceps: 4});
    // Linear would put biceps at 1.0; sqrt lifts it to 2.0.
    expect(result['biceps'], closeTo(4.0 * math.sqrt(4 / 16), 1e-9));
    expect(result['biceps'], closeTo(2.0, 1e-9));
  });

  test('overlapping body parts accumulate before normalizing', () {
    // Shoulders and back both hit trapezius (0.3 + 0.6 weights).
    final result = HeatmapIntensityService.intensitiesFromUsage(
        {BodyPart.shoulders: 10, BodyPart.back: 10});
    // trapezius score = 10*0.3 + 10*0.6 = 9; max is latissimusDorsi/deltoids
    // family — deltoids 10, posteriorDeltoid 10+4=14 → max 14.
    final expected = 4.0 * math.sqrt(9 / 14);
    expect(result['trapezius'], closeTo(expected, 1e-9));
  });

  test('all outputs clamp inside 0..4', () {
    final result = HeatmapIntensityService.intensitiesFromUsage({
      for (final part in BodyPart.values) part: 100,
    });
    for (final v in result.values) {
      expect(v, inInclusiveRange(0.0, 4.0));
    }
  });

  test('exercise preview scales weights to 0..4 statically', () {
    final preview = HeatmapIntensityService.previewForBodyPart(BodyPart.back);
    expect(preview['latissimusDorsi'], 4.0);
    expect(preview['teresMajor'], closeTo(3.2, 1e-9));
    expect(HeatmapIntensityService.previewForBodyPart(BodyPart.none), isEmpty);
  });
}
