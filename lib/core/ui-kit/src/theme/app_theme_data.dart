import 'package:demo_project/core/ui-kit/src/theme/colors/app_dark_colors.dart';
import 'package:demo_project/core/ui-kit/src/theme/colors/app_light_colors.dart';
import 'package:demo_project/core/ui-kit/src/theme/colors/base_colors.dart';
import 'package:demo_project/core/ui-kit/src/theme/enums/theme_data_type.dart';
import 'package:demo_project/core/ui-kit/src/theme/extension/app_colors_extension.dart';
import 'package:demo_project/core/ui-kit/src/theme/extension/app_layout_extension.dart';
import 'package:demo_project/core/ui-kit/src/theme/extension/app_text_style_extension.dart';
import 'package:demo_project/core/ui-kit/src/theme/layout/app_layout.dart';
import 'package:demo_project/core/ui-kit/src/theme/layout/base_layout.dart';
import 'package:demo_project/core/ui-kit/src/theme/typography/app_text_styles.dart';
import 'package:demo_project/core/ui-kit/src/theme/typography/base_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  BaseColors _getColors(ThemeDataType type) => switch (type) {
        ThemeDataType.dark => AppDarkColors(),
        ThemeDataType.light => AppLightColors(),
      };

  BaseTextStyles get _getTextStyles => AppTextStyles();

  BaseLayout get _getLayout => AppLayout();

  ThemeData getTheme(ThemeDataType type) {
    final colors = _getColors(type);
    final textStyles = _getTextStyles;
    final layout = _getLayout;
    final isDark = type == ThemeDataType.dark;

    final colorScheme = ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      primaryContainer: colors.primaryVariant.withValues(alpha: 0.2),
      onPrimaryContainer: colors.primaryVariant,
      secondary: colors.accentVariant,
      onSecondary: colors.staticWhite,
      error: colors.error,
      onError: colors.staticWhite,
      surface: colors.background,
      onSurface: colors.textPrimary,
      surfaceContainer: colors.surface,
      onSurfaceVariant: colors.textSecondary,
      outline: colors.gray400,
      outlineVariant: colors.gray300,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.background,

      // Typography Mapping
      textTheme: GoogleFonts.interTextTheme(
        TextTheme(
          displayLarge: textStyles.display,
          headlineLarge: textStyles.h1,
          headlineMedium: textStyles.h2,
          bodyLarge: textStyles.bodyL,
          bodyMedium: textStyles.bodyM,
          bodySmall: textStyles.bodyS,
          labelSmall: textStyles.labelS,
        ),
      ),

      // Component Themes
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        titleTextStyle: textStyles.h2.copyWith(color: colors.textPrimary),
      ),

      cardTheme: CardThemeData(
        color: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(layout.r12),
          side: BorderSide(color: colors.gray200),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        contentPadding: EdgeInsets.symmetric(
          horizontal: layout.s16,
          vertical: layout.s12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.gray300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.gray300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.error),
        ),
        hintStyle: textStyles.bodyM.copyWith(color: colors.textTertiary),
        labelStyle: textStyles.bodyM.copyWith(color: colors.textSecondary),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          textStyle: textStyles.bodyL.copyWith(fontWeight: FontWeight.w600),
          padding: EdgeInsets.symmetric(
            horizontal: layout.s24,
            vertical: layout.s12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(layout.r8),
          ),
          elevation: 0,
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          textStyle: textStyles.bodyM.copyWith(fontWeight: FontWeight.w600),
          padding: EdgeInsets.symmetric(
            horizontal: layout.s16,
            vertical: layout.s8,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(layout.r100),
          ),
        ),
      ),

      extensions: [
        AppTextStyleExtension(
          display: textStyles.display,
          h1: textStyles.h1,
          h2: textStyles.h2,
          bodyL: textStyles.bodyL,
          bodyM: textStyles.bodyM,
          bodyS: textStyles.bodyS,
          labelS: textStyles.labelS,
        ),

        AppLayoutExtension(
          s2: layout.s2,
          s4: layout.s4,
          s8: layout.s8,
          s12: layout.s12,
          s16: layout.s16,
          s24: layout.s24,
          s32: layout.s32,
          r4: layout.r4,
          r8: layout.r8,
          r12: layout.r12,
          r16: layout.r16,
          r100: layout.r100,
        ),

        AppColorsExtension(
          background: colors.background,
          surface: colors.surface,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          textPrimary: colors.textPrimary,
          textSecondary: colors.textSecondary,
          textTertiary: colors.textTertiary,
          textInverted: colors.textInverted,
          iconPrimary: colors.iconPrimary,
          success: colors.success,
          error: colors.error,
          warning: colors.warning,
          tapBarBg: colors.tapBarBg,
          iconBg: colors.iconBg,
          buttonBg: colors.buttonBg,
          segmentBg: colors.segmentBg,
          popUpBg: colors.popUpBg,
          staticWhite: colors.staticWhite,
          staticBlack: colors.staticBlack,
          gray100: colors.gray100,
          gray200: colors.gray200,
          gray300: colors.gray300,
          gray400: colors.gray400,
          gray500: colors.gray500,
          gray600: colors.gray600,
          gray700: colors.gray700,
          gray800: colors.gray800,
          gray900: colors.gray900,
          primaryVariant: colors.primaryVariant,
          accentVariant: colors.accentVariant,
        ),
      ],
    );
  }
}
