/// SharedPreferences keys. Drift holds data; prefs hold preferences (doc §12.2).
abstract final class PrefKeys {
  static const String themeMode = 'theme_mode_preference';
  static const String measurementSystem = 'measurement_system';
  static const String heatmapFigureIsMale = 'heatmap_figure_is_male';
  static const String suppressWorkoutExitWarning = 'suppressWorkoutExitWarning';
  static const String suppressExerciseDeletionWarning =
      'suppressExerciseDeletionWarning';
  static const String suppressRoutineDeletionWarning =
      'suppressRoutineDeletionWarning';

  /// Keys cleared by the "reset app preferences" settings action.
  static const List<String> resettable = [
    suppressWorkoutExitWarning,
    suppressExerciseDeletionWarning,
    suppressRoutineDeletionWarning,
  ];
}
