enum ExerciseCategory {
  strength('Strength'),
  cardio('Cardio');

  const ExerciseCategory(this.label);
  final String label;

  static ExerciseCategory parse(String name) =>
      ExerciseCategory.values.asNameMap()[name] ?? ExerciseCategory.strength;
}
