/// App-wide tuning constants (doc §14).
abstract final class ConfigConstants {
  static const int maxSetsPerExercise = 12;
  static const int maxExercisesPerRoutine = 20;
  static const int initialSetsDisplayed = 6;
  static const Duration draftAutosaveDebounce = Duration(milliseconds: 500);
  static const List<int> restTimerPresetsSeconds = [30, 60, 90, 120, 180];

  /// The single offline user row id.
  static const String localUserId = 'local';

  static const String riveAssetPath =
      'assets/rive/human_anatomy_advanced_v3.0.riv';
  static const String fitnessVisualsUrl = 'https://fitnessvisuals.com';
}
