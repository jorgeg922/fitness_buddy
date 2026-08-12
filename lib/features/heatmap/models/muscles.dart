/// Names of every muscle ViewModel exposed by `human_anatomy_advanced_v3.0.riv`.
/// These strings are the literal view-model names defined in the Rive editor —
/// changing one here without changing the .riv (or vice versa) makes
/// `vm.viewModel(...)` lookups silently return null. Guarded by unit tests.
const List<String> allMuscles = [
  'flexorCarpiUlnaris',
  'posteriorDeltoid',
  'tricepsBrachii',
  'teresMajor',
  'latissimusDorsi',
  'gluteusMaximus',
  'bicepsFemoris',
  'semitendinosus',
  'adductorMagnus',
  'erectorSpinae',
  'sternocleidomastoid',
  'trapezius',
  'pectoralisMajor',
  'deltoids',
  'rectusAbdominis',
  'externalObliques',
  'biceps',
  'brachialis',
  'brachioradialis',
  'extensorCarpiUlnaris',
  'flexorCarpiRadialis',
  'sartorius',
  'rectusFemoris',
  'vastusMedialis',
  'vastusLateralis',
  'gluteusMedius',
  'tibialisAnterior',
  'soleus',
  'gastrocnemius',
];

/// Muscles visible on the front artboards (includes both-sides muscles).
const Set<String> frontMuscles = {
  'pectoralisMajor',
  'deltoids',
  'rectusAbdominis',
  'externalObliques',
  'biceps',
  'brachialis',
  'flexorCarpiRadialis',
  'sartorius',
  'rectusFemoris',
  'vastusMedialis',
  'vastusLateralis',
  'tibialisAnterior',
  'sternocleidomastoid',
  'trapezius',
  'flexorCarpiUlnaris',
  'brachioradialis',
  'extensorCarpiUlnaris',
  'gastrocnemius',
};

/// Muscles visible on the back artboards (includes both-sides muscles).
const Set<String> backMuscles = {
  'posteriorDeltoid',
  'tricepsBrachii',
  'teresMajor',
  'latissimusDorsi',
  'gluteusMaximus',
  'gluteusMedius',
  'bicepsFemoris',
  'semitendinosus',
  'adductorMagnus',
  'erectorSpinae',
  'soleus',
  'trapezius',
  'flexorCarpiUlnaris',
  'brachioradialis',
  'extensorCarpiUlnaris',
  'gastrocnemius',
};

/// User-facing names for the 29 muscle keys.
const Map<String, String> muscleLabels = {
  'flexorCarpiUlnaris': 'Flexor Carpi Ulnaris',
  'posteriorDeltoid': 'Rear Deltoid',
  'tricepsBrachii': 'Triceps',
  'teresMajor': 'Teres Major',
  'latissimusDorsi': 'Lats',
  'gluteusMaximus': 'Gluteus Maximus',
  'bicepsFemoris': 'Biceps Femoris',
  'semitendinosus': 'Semitendinosus',
  'adductorMagnus': 'Adductor Magnus',
  'erectorSpinae': 'Erector Spinae',
  'sternocleidomastoid': 'Neck',
  'trapezius': 'Traps',
  'pectoralisMajor': 'Chest',
  'deltoids': 'Front Deltoid',
  'rectusAbdominis': 'Abs',
  'externalObliques': 'Obliques',
  'biceps': 'Biceps',
  'brachialis': 'Brachialis',
  'brachioradialis': 'Brachioradialis',
  'extensorCarpiUlnaris': 'Extensor Carpi Ulnaris',
  'flexorCarpiRadialis': 'Flexor Carpi Radialis',
  'sartorius': 'Sartorius',
  'rectusFemoris': 'Rectus Femoris',
  'vastusMedialis': 'Vastus Medialis',
  'vastusLateralis': 'Vastus Lateralis',
  'gluteusMedius': 'Gluteus Medius',
  'tibialisAnterior': 'Tibialis Anterior',
  'soleus': 'Soleus',
  'gastrocnemius': 'Calves',
};

/// Anatomical grouping so list UIs show ~14 rows instead of 29.
class MuscleGroup {
  const MuscleGroup({
    required this.key,
    required this.label,
    required this.muscles,
  });

  /// Stable identifier used as the key in intensity maps.
  final String key;
  final String label;

  /// Underlying muscle VM names.
  final List<String> muscles;
}

const List<MuscleGroup> muscleGroups = [
  MuscleGroup(key: 'chest', label: 'Chest', muscles: ['pectoralisMajor']),
  MuscleGroup(
    key: 'shoulders',
    label: 'Shoulders',
    muscles: ['deltoids', 'posteriorDeltoid'],
  ),
  MuscleGroup(
    key: 'back',
    label: 'Back',
    muscles: ['latissimusDorsi', 'teresMajor', 'erectorSpinae'],
  ),
  MuscleGroup(
    key: 'traps',
    label: 'Traps & Neck',
    muscles: ['trapezius', 'sternocleidomastoid'],
  ),
  MuscleGroup(
    key: 'biceps',
    label: 'Biceps',
    muscles: ['biceps', 'brachialis'],
  ),
  MuscleGroup(key: 'triceps', label: 'Triceps', muscles: ['tricepsBrachii']),
  MuscleGroup(
    key: 'forearms',
    label: 'Forearms',
    muscles: [
      'brachioradialis',
      'flexorCarpiUlnaris',
      'flexorCarpiRadialis',
      'extensorCarpiUlnaris',
    ],
  ),
  MuscleGroup(key: 'abs', label: 'Abs', muscles: ['rectusAbdominis']),
  MuscleGroup(
    key: 'obliques',
    label: 'Obliques',
    muscles: ['externalObliques'],
  ),
  MuscleGroup(
    key: 'glutes',
    label: 'Glutes',
    muscles: ['gluteusMaximus', 'gluteusMedius'],
  ),
  MuscleGroup(
    key: 'quads',
    label: 'Quads',
    muscles: [
      'rectusFemoris',
      'vastusMedialis',
      'vastusLateralis',
      'sartorius',
    ],
  ),
  MuscleGroup(
    key: 'hamstrings',
    label: 'Hamstrings',
    muscles: ['bicepsFemoris', 'semitendinosus'],
  ),
  MuscleGroup(
    key: 'adductors',
    label: 'Adductors',
    muscles: ['adductorMagnus'],
  ),
  MuscleGroup(
    key: 'calves',
    label: 'Calves & Shins',
    muscles: [
      'gastrocnemius',
      'soleus',
      'tibialisAnterior',
    ],
  ),
];

/// Reverse lookup: muscle key → its UI group. Built once.
final Map<String, MuscleGroup> muscleToGroup = {
  for (final group in muscleGroups)
    for (final muscle in group.muscles) muscle: group,
};
