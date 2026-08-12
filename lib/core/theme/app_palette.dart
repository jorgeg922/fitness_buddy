import 'package:flutter/material.dart';

/// Brand design tokens. Widgets should reach for [ThemeData] /
/// [AppCustomColors] first; these raw values are for theme construction.
abstract final class AppPalette {
  static const Color brandTeal = Color(0xFF2B5A62);
  static const Color brandOrange = Color(0xFFEB7F27);
  static const Color brandYellow = Color(0xFFFFD167);

  // Heat scale (level 0 base is theme-dependent, see HeatmapTheme).
  static const Color heatLevel1 = Color(0xFFFFD167);
  static const Color heatLevel2 = Color(0xFFEB7F27);
  static const Color heatLevel3 = Color(0xFFE8442E);
  static const Color heatLevel4 = Color(0xFFB01212);

  static const Color success = Color(0xFF2E7D32);
  static const Color successDark = Color(0xFF81C784);
}
