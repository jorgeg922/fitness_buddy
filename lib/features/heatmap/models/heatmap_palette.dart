import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';

/// Five-stop color ramp the heatmap interpolates across as intensity goes
/// 0→4. Mirrors the per-muscle PaletteViewModel properties inside the .riv.
class HeatmapPalette {
  const HeatmapPalette({
    required this.base,
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
  });

  final Color base;
  final Color level1;
  final Color level2;
  final Color level3;
  final Color level4;

  /// The stop nearest an intensity — for non-Rive UI (bars, chips) that must
  /// match what the figure shows.
  Color colorFor(double intensity) => switch (intensity) {
        < 0.5 => base,
        < 1.5 => level1,
        < 2.5 => level2,
        < 3.5 => level3,
        _ => level4,
      };

  @override
  bool operator ==(Object other) =>
      other is HeatmapPalette &&
      other.base == base &&
      other.level1 == level1 &&
      other.level2 == level2 &&
      other.level3 == level3 &&
      other.level4 == level4;

  @override
  int get hashCode => Object.hash(base, level1, level2, level3, level4);
}

/// Theme-aware heat palette so heat colors track light/dark mode. Widgets
/// ask the theme; nothing hardcodes heat colors.
@immutable
class HeatmapTheme extends ThemeExtension<HeatmapTheme> {
  const HeatmapTheme({required this.palette});

  final HeatmapPalette palette;

  static const light = HeatmapTheme(
    palette: HeatmapPalette(
      base: Color(0xFFB2B2B2),
      level1: AppPalette.heatLevel1,
      level2: AppPalette.heatLevel2,
      level3: AppPalette.heatLevel3,
      level4: AppPalette.heatLevel4,
    ),
  );

  static const dark = HeatmapTheme(
    palette: HeatmapPalette(
      base: Color(0xFF3A4547),
      level1: AppPalette.heatLevel1,
      level2: AppPalette.heatLevel2,
      level3: AppPalette.heatLevel3,
      level4: AppPalette.heatLevel4,
    ),
  );

  @override
  HeatmapTheme copyWith({HeatmapPalette? palette}) =>
      HeatmapTheme(palette: palette ?? this.palette);

  @override
  HeatmapTheme lerp(ThemeExtension<HeatmapTheme>? other, double t) {
    if (other is! HeatmapTheme) return this;
    return HeatmapTheme(
      palette: HeatmapPalette(
        base: Color.lerp(palette.base, other.palette.base, t)!,
        level1: Color.lerp(palette.level1, other.palette.level1, t)!,
        level2: Color.lerp(palette.level2, other.palette.level2, t)!,
        level3: Color.lerp(palette.level3, other.palette.level3, t)!,
        level4: Color.lerp(palette.level4, other.palette.level4, t)!,
      ),
    );
  }
}

extension HeatmapThemeX on ThemeData {
  HeatmapPalette get heatmapPalette =>
      extension<HeatmapTheme>()?.palette ?? HeatmapTheme.light.palette;
}
