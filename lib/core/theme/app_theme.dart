import 'package:flutter/material.dart';

import '../../features/heatmap/models/heatmap_palette.dart';
import 'app_custom_colors.dart';
import 'app_palette.dart';

abstract final class AppTheme {
  static ThemeData light() =>
      _build(Brightness.light, AppCustomColors.light, HeatmapTheme.light);

  static ThemeData dark() =>
      _build(Brightness.dark, AppCustomColors.dark, HeatmapTheme.dark);

  static ThemeData _build(Brightness brightness, AppCustomColors custom,
      HeatmapTheme heatmap) {
    final scheme = ColorScheme.fromSeed(
      seedColor: AppPalette.brandTeal,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
      ),
      cardTheme: const CardThemeData(
        surfaceTintColor: Colors.transparent,
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
      extensions: [custom, heatmap],
    );
  }
}
