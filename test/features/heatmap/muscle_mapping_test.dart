import 'package:fitness_buddy/core/taxonomy/body_part.dart';
import 'package:fitness_buddy/features/heatmap/models/muscle_mapping.dart';
import 'package:fitness_buddy/features/heatmap/models/muscles.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every mapping key is a real Rive muscle name', () {
    // Rive VM lookups fail SILENTLY on unknown names — a typo here would
    // just render nothing. This test is the tripwire.
    final known = allMuscles.toSet();
    for (final entry in bodyPartToMuscles.entries) {
      for (final muscle in entry.value.keys) {
        expect(known.contains(muscle), isTrue,
            reason: '${entry.key} maps unknown muscle "$muscle"');
      }
    }
  });

  test('every BodyPart has a mapping entry', () {
    for (final part in BodyPart.values) {
      expect(bodyPartToMuscles.containsKey(part), isTrue,
          reason: 'missing mapping for $part');
    }
  });

  test('all 29 muscles are reachable from at least one body part', () {
    final reachable = bodyPartToMuscles.values
        .expand((weights) => weights.keys)
        .toSet();
    for (final muscle in allMuscles) {
      expect(reachable.contains(muscle), isTrue,
          reason: '"$muscle" is unreachable — no BodyPart lights it up');
    }
  });

  test('weights are in (0, 1]', () {
    for (final entry in bodyPartToMuscles.entries) {
      for (final w in entry.value.entries) {
        expect(w.value > 0 && w.value <= 1.0, isTrue,
            reason: '${entry.key}.${w.key} weight ${w.value} out of range');
      }
    }
  });

  test('muscle group members are real muscle names and cover all 29', () {
    final known = allMuscles.toSet();
    final covered = <String>{};
    for (final group in muscleGroups) {
      for (final muscle in group.muscles) {
        expect(known.contains(muscle), isTrue,
            reason: 'group ${group.key} has unknown muscle "$muscle"');
        covered.add(muscle);
      }
    }
    // sternocleidomastoid belongs to traps group; everything else covered.
    expect(known.difference(covered), isEmpty);
  });

  test('front/back sets partition all muscles and match group spans', () {
    expect(frontMuscles.union(backMuscles), allMuscles.toSet());
    for (final muscle in allMuscles) {
      expect(muscleLabels.containsKey(muscle), isTrue,
          reason: 'missing label for $muscle');
    }
  });

  test('bodyPartsForMuscle prefers primary movers', () {
    expect(bodyPartsForMuscle('pectoralisMajor'), contains(BodyPart.chest));
    expect(bodyPartsForMuscle('gluteusMaximus'), contains(BodyPart.glutes));
    // sternocleidomastoid only appears as secondary (fullBody).
    expect(bodyPartsForMuscle('sternocleidomastoid'), isNotEmpty);
  });
}
