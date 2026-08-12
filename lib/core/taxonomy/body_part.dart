enum BodyPart {
  chest('Chest'),
  back('Back'),
  shoulders('Shoulders'),
  biceps('Biceps'),
  triceps('Triceps'),
  forearms('Forearms'),
  abs('Abs'),
  obliques('Obliques'),
  quads('Quads'),
  hamstrings('Hamstrings'),
  glutes('Glutes'),
  calves('Calves'),
  arms('Arms'),
  legs('Legs'),
  core('Core'),
  fullBody('Full Body'),
  none('None');

  const BodyPart(this.label);
  final String label;

  /// Generic → specific expansion used by the SQL filter, so filtering
  /// "legs" also matches quads/hamstrings/glutes/calves (doc §7).
  static const Map<BodyPart, List<BodyPart>> genericToSpecific = {
    BodyPart.arms: [
      BodyPart.arms,
      BodyPart.biceps,
      BodyPart.triceps,
      BodyPart.forearms,
    ],
    BodyPart.legs: [
      BodyPart.legs,
      BodyPart.quads,
      BodyPart.hamstrings,
      BodyPart.glutes,
      BodyPart.calves,
    ],
    BodyPart.core: [BodyPart.core, BodyPart.abs, BodyPart.obliques],
  };

  /// All body parts a filter on `this` should match.
  List<BodyPart> get expanded => genericToSpecific[this] ?? [this];

  static BodyPart parse(String name) =>
      BodyPart.values.asNameMap()[name] ?? BodyPart.none;
}
