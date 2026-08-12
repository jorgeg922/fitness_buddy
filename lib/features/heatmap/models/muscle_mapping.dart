import '../../../core/taxonomy/body_part.dart';

/// The bridge between the app's 17-value BodyPart taxonomy (what exercises
/// and usage rows are tagged with) and the Rive asset's 29 addressable
/// muscles. Weights are relative contribution (1.0 = primary mover).
///
/// This is opinion, not data — living in code means tuning it never needs a
/// migration or reseed. Integrity is guarded by unit tests: every key must be
/// a real Rive muscle name (VM lookups fail SILENTLY on typos) and all 29
/// muscles must be reachable.
const Map<BodyPart, Map<String, double>> bodyPartToMuscles = {
  BodyPart.chest: {'pectoralisMajor': 1.0},
  BodyPart.back: {
    'latissimusDorsi': 1.0,
    'teresMajor': 0.8,
    'trapezius': 0.6,
    'erectorSpinae': 0.5,
    'posteriorDeltoid': 0.4,
  },
  BodyPart.shoulders: {
    'deltoids': 1.0,
    'posteriorDeltoid': 1.0,
    'trapezius': 0.3,
  },
  BodyPart.biceps: {
    'biceps': 1.0,
    'brachialis': 0.8,
    'brachioradialis': 0.4,
  },
  BodyPart.triceps: {'tricepsBrachii': 1.0},
  BodyPart.forearms: {
    'brachioradialis': 1.0,
    'flexorCarpiRadialis': 1.0,
    'flexorCarpiUlnaris': 1.0,
    'extensorCarpiUlnaris': 1.0,
  },
  BodyPart.abs: {
    'rectusAbdominis': 1.0,
    'externalObliques': 0.3,
  },
  BodyPart.obliques: {
    'externalObliques': 1.0,
    'rectusAbdominis': 0.3,
  },
  BodyPart.quads: {
    'rectusFemoris': 1.0,
    'vastusLateralis': 1.0,
    'vastusMedialis': 1.0,
    'sartorius': 0.4,
  },
  BodyPart.hamstrings: {
    'bicepsFemoris': 1.0,
    'semitendinosus': 1.0,
    'gluteusMaximus': 0.3,
  },
  BodyPart.glutes: {
    'gluteusMaximus': 1.0,
    'gluteusMedius': 0.8,
    'adductorMagnus': 0.3,
  },
  BodyPart.calves: {
    'gastrocnemius': 1.0,
    'soleus': 1.0,
    'tibialisAnterior': 0.4,
  },
  // Neck has no dedicated BodyPart; sternocleidomastoid rides on traps-heavy
  // full-body work below and shoulders via trapezius. Generic parts spread
  // at reduced weight:
  BodyPart.arms: {
    'biceps': 0.8,
    'tricepsBrachii': 0.8,
    'brachialis': 0.6,
    'brachioradialis': 0.5,
    'deltoids': 0.3,
  },
  BodyPart.legs: {
    'rectusFemoris': 0.8,
    'vastusLateralis': 0.8,
    'vastusMedialis': 0.8,
    'bicepsFemoris': 0.8,
    'semitendinosus': 0.8,
    'gluteusMaximus': 0.6,
    'adductorMagnus': 0.8,
    'gastrocnemius': 0.5,
    'soleus': 0.5,
    'tibialisAnterior': 0.4,
  },
  BodyPart.core: {
    'rectusAbdominis': 0.8,
    'externalObliques': 0.8,
    'erectorSpinae': 0.6,
  },
  BodyPart.fullBody: {
    'deltoids': 0.5,
    'trapezius': 0.5,
    'sternocleidomastoid': 0.3,
    'pectoralisMajor': 0.4,
    'latissimusDorsi': 0.5,
    'erectorSpinae': 0.6,
    'gluteusMaximus': 0.6,
    'rectusFemoris': 0.5,
    'bicepsFemoris': 0.5,
    'gastrocnemius': 0.4,
    'rectusAbdominis': 0.4,
    'brachioradialis': 0.3,
  },
  BodyPart.none: {},
};

/// Reverse lookup: which body parts light up a muscle at full weight —
/// used by "Find exercises for this muscle". Prefers specific parts (weight
/// >= 1.0); falls back to any contributor.
List<BodyPart> bodyPartsForMuscle(String muscle) {
  final primary = <BodyPart>[];
  final secondary = <BodyPart>[];
  for (final entry in bodyPartToMuscles.entries) {
    final weight = entry.value[muscle];
    if (weight == null) continue;
    (weight >= 1.0 ? primary : secondary).add(entry.key);
  }
  return primary.isNotEmpty ? primary : secondary;
}
