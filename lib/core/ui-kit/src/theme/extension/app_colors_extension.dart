import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color background;
  final Color surface;
  final Color primary;
  final Color onPrimary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textInverted;
  final Color iconPrimary;
  final Color success;
  final Color error;
  final Color warning;

  final Color tapBarBg;
  final Color iconBg;
  final Color buttonBg;
  final Color segmentBg;
  final Color popUpBg;
  final Color staticWhite;
  final Color staticBlack;

  final Color gray100;
  final Color gray200;
  final Color gray300;
  final Color gray400;
  final Color gray500;
  final Color gray600;
  final Color gray700;
  final Color gray800;
  final Color gray900;
  final Color primaryVariant;
  final Color accentVariant;

   AppColorsExtension({
    required this.background,
    required this.surface,
    required this.primary,
    required this.onPrimary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textInverted,
    required this.iconPrimary,
    required this.success,
    required this.error,
    required this.warning,
    required this.tapBarBg,
    required this.iconBg,
    required this.buttonBg,
    required this.segmentBg,
    required this.popUpBg,
    required this.staticWhite,
    required this.staticBlack,
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
    Color? primary,
    Color? onPrimary,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textInverted,
    Color? iconPrimary,
    Color? success,
    Color? error,
    Color? warning,
    Color? tapBarBg,
    Color? iconBg,
    Color? buttonBg,
    Color? segmentBg,
    Color? popUpBg,
    Color? staticWhite,
    Color? staticBlack,
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
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textInverted: textInverted ?? this.textInverted,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      tapBarBg: tapBarBg ?? this.tapBarBg,
      iconBg: iconBg ?? this.iconBg,
      buttonBg: buttonBg ?? this.buttonBg,
      segmentBg: segmentBg ?? this.segmentBg,
      popUpBg: popUpBg ?? this.popUpBg,
      staticWhite: staticWhite ?? this.staticWhite,
      staticBlack: staticBlack ?? this.staticBlack,
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
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textInverted: Color.lerp(textInverted, other.textInverted, t)!,
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      tapBarBg: Color.lerp(tapBarBg, other.tapBarBg, t)!,
      iconBg: Color.lerp(iconBg, other.iconBg, t)!,
      buttonBg: Color.lerp(buttonBg, other.buttonBg, t)!,
      segmentBg: Color.lerp(segmentBg, other.segmentBg, t)!,
      popUpBg: Color.lerp(popUpBg, other.popUpBg, t)!,
      staticWhite: Color.lerp(staticWhite, other.staticWhite, t)!,
      staticBlack: Color.lerp(staticBlack, other.staticBlack, t)!,
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
