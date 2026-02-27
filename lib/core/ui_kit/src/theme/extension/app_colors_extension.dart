import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  // --- Core Semantic ---
  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color surfaceElevated;
  final Color onBackground;
  final Color onSurface;
  final Color primary;
  final Color onPrimary;
  final Color primaryLight;
  final Color divider;
  final Color border;
  final Color overlay;

  // --- Constant Colors ---
  final Color staticWhite;
  final Color staticBlack;

  // --- Content ---
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textDisabled;
  final Color textInverted;
  final Color iconPrimary;
  final Color iconSecondary;

  // --- Interactive States ---
  final Color disabled;

  // --- Status ---
  final Color success;
  final Color error;
  final Color warning;
  final Color info;

  // --- Primitive Palette ---
  final Color gray100;
  final Color gray200;
  final Color gray300;
  final Color gray400;
  final Color gray500;
  final Color gray600;
  final Color gray700;
  final Color gray800;
  final Color gray900;

  // --- Brand Variants ---
  final Color primaryVariant;
  final Color accentVariant;

  AppColorsExtension({
    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.surfaceElevated,
    required this.onBackground,
    required this.onSurface,
    required this.primary,
    required this.onPrimary,
    required this.primaryLight,
    required this.divider,
    required this.border,
    required this.overlay,
    required this.staticWhite,
    required this.staticBlack,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textDisabled,
    required this.textInverted,
    required this.iconPrimary,
    required this.iconSecondary,
    required this.disabled,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
    required this.gray100,
    required this.gray200,
    required this.gray300,
    required this.gray400,
    required this.gray500,
    required this.gray600,
    required this.gray700,
    required this.gray800,
    required this.gray900,
    required this.primaryVariant,
    required this.accentVariant,
  });

  @override
  AppColorsExtension copyWith({
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? surfaceElevated,
    Color? onBackground,
    Color? onSurface,
    Color? primary,
    Color? onPrimary,
    Color? primaryLight,
    Color? divider,
    Color? border,
    Color? overlay,
    Color? staticWhite,
    Color? staticBlack,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textDisabled,
    Color? textInverted,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? disabled,
    Color? success,
    Color? error,
    Color? warning,
    Color? info,
    Color? gray100,
    Color? gray200,
    Color? gray300,
    Color? gray400,
    Color? gray500,
    Color? gray600,
    Color? gray700,
    Color? gray800,
    Color? gray900,
    Color? primaryVariant,
    Color? accentVariant,
  }) {
    return AppColorsExtension(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      onBackground: onBackground ?? this.onBackground,
      onSurface: onSurface ?? this.onSurface,
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryLight: primaryLight ?? this.primaryLight,
      divider: divider ?? this.divider,
      border: border ?? this.border,
      overlay: overlay ?? this.overlay,
      staticWhite: staticWhite ?? this.staticWhite,
      staticBlack: staticBlack ?? this.staticBlack,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textDisabled: textDisabled ?? this.textDisabled,
      textInverted: textInverted ?? this.textInverted,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      disabled: disabled ?? this.disabled,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      gray100: gray100 ?? this.gray100,
      gray200: gray200 ?? this.gray200,
      gray300: gray300 ?? this.gray300,
      gray400: gray400 ?? this.gray400,
      gray500: gray500 ?? this.gray500,
      gray600: gray600 ?? this.gray600,
      gray700: gray700 ?? this.gray700,
      gray800: gray800 ?? this.gray800,
      gray900: gray900 ?? this.gray900,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      accentVariant: accentVariant ?? this.accentVariant,
    );
  }

  @override
  AppColorsExtension lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      border: Color.lerp(border, other.border, t)!,
      overlay: Color.lerp(overlay, other.overlay, t)!,
      staticWhite: Color.lerp(staticWhite, other.staticWhite, t)!,
      staticBlack: Color.lerp(staticBlack, other.staticBlack, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textInverted: Color.lerp(textInverted, other.textInverted, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      gray100: Color.lerp(gray100, other.gray100, t)!,
      gray200: Color.lerp(gray200, other.gray200, t)!,
      gray300: Color.lerp(gray300, other.gray300, t)!,
      gray400: Color.lerp(gray400, other.gray400, t)!,
      gray500: Color.lerp(gray500, other.gray500, t)!,
      gray600: Color.lerp(gray600, other.gray600, t)!,
      gray700: Color.lerp(gray700, other.gray700, t)!,
      gray800: Color.lerp(gray800, other.gray800, t)!,
      gray900: Color.lerp(gray900, other.gray900, t)!,
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
      accentVariant: Color.lerp(accentVariant, other.accentVariant, t)!,
    );
  }

  static AppColorsExtension? of(BuildContext context) =>
      Theme.of(context).extension<AppColorsExtension>();
}
