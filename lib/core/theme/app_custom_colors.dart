import 'package:flutter/material.dart';

import 'app_palette.dart';

/// App-specific semantic colors not covered by [ColorScheme].
@immutable
class AppCustomColors extends ThemeExtension<AppCustomColors> {
  const AppCustomColors({
    required this.success,
    required this.subduedText,
    required this.favorite,
  });

  final Color success;
  final Color subduedText;
  final Color favorite;

  static const light = AppCustomColors(
    success: AppPalette.success,
    subduedText: Color(0xFF6B7280),
    favorite: AppPalette.brandOrange,
  );

  static const dark = AppCustomColors(
    success: AppPalette.successDark,
    subduedText: Color(0xFF9CA3AF),
    favorite: AppPalette.brandYellow,
  );

  @override
  AppCustomColors copyWith({
    Color? success,
    Color? subduedText,
    Color? favorite,
  }) {
    return AppCustomColors(
      success: success ?? this.success,
      subduedText: subduedText ?? this.subduedText,
      favorite: favorite ?? this.favorite,
    );
  }

  @override
  AppCustomColors lerp(ThemeExtension<AppCustomColors>? other, double t) {
    if (other is! AppCustomColors) return this;
    return AppCustomColors(
      success: Color.lerp(success, other.success, t)!,
      subduedText: Color.lerp(subduedText, other.subduedText, t)!,
      favorite: Color.lerp(favorite, other.favorite, t)!,
    );
  }
}

extension AppCustomColorsX on ThemeData {
  AppCustomColors get customColors => extension<AppCustomColors>()!;
}
