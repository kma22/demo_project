import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors/app_dark_colors.dart';
import 'colors/app_light_colors.dart';
import 'colors/base_colors.dart';
import 'enums/theme_data_type.dart';
import 'extension/app_colors_extension.dart';
import 'extension/app_layout_extension.dart';
import 'extension/app_text_style_extension.dart';
import 'layout/app_layout.dart';
import 'layout/base_layout.dart';
import 'typography/app_text_styles.dart';
import 'typography/base_text_styles.dart';

class AppThemeData {
  BaseColors _getColors(ThemeDataType type) => switch (type) {
    ThemeDataType.dark => AppDarkColors(),
    ThemeDataType.light => AppLightColors(),
  };

  BaseTextStyles get _textStyles => AppTextStyles();

  BaseLayout get _layout => AppLayout();

  ThemeData getTheme(ThemeDataType type) {
    final colors = _getColors(type);
    final textStyles = _textStyles;
    final layout = _layout;
    final isDark = type == ThemeDataType.dark;

    final colorScheme = ColorScheme(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      primaryContainer: colors.primaryLight,
      onPrimaryContainer: colors.primary,
      secondary: colors.accentVariant,
      onSecondary: colors.staticWhite,
      error: colors.error,
      onError: colors.staticWhite,
      surface: colors.background,
      onSurface: colors.textPrimary,
      surfaceContainer: colors.surface,
      surfaceContainerHighest: colors.surfaceElevated,
      onSurfaceVariant: colors.textSecondary,
      outline: colors.border,
      outlineVariant: colors.divider,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colors.background,
      dividerColor: colors.divider,

      // Typography
      textTheme: GoogleFonts.interTextTheme(
        TextTheme(
          displayLarge: textStyles.display,
          headlineLarge: textStyles.h1,
          headlineMedium: textStyles.h2,
          headlineSmall: textStyles.h3,
          bodyLarge: textStyles.bodyL,
          bodyMedium: textStyles.bodyM,
          bodySmall: textStyles.bodyS,
          labelLarge: textStyles.labelL,
          labelMedium: textStyles.labelM,
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
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(layout.r12),
          side: BorderSide(color: colors.divider),
        ),
      ),

      dividerTheme: DividerThemeData(color: colors.divider, thickness: 1, space: 1),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: layout.s16, vertical: layout.s12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.error, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(layout.r8),
          borderSide: BorderSide(color: colors.disabled),
        ),
        hintStyle: textStyles.bodyM.copyWith(color: colors.textTertiary),
        labelStyle: textStyles.bodyM.copyWith(color: colors.textSecondary),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          disabledBackgroundColor: colors.disabled,
          disabledForegroundColor: colors.textDisabled,
          textStyle: textStyles.labelL,
          padding: EdgeInsets.symmetric(horizontal: layout.s24, vertical: layout.s12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(layout.r8)),
          elevation: 0,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.primary,
          disabledForegroundColor: colors.textDisabled,
          textStyle: textStyles.labelL,
          padding: EdgeInsets.symmetric(horizontal: layout.s24, vertical: layout.s12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(layout.r8)),
          side: BorderSide(color: colors.border),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colors.primary,
          disabledForegroundColor: colors.textDisabled,
          textStyle: textStyles.labelL,
          padding: EdgeInsets.symmetric(horizontal: layout.s16, vertical: layout.s8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(layout.r8)),
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colors.surfaceVariant,
        selectedColor: colors.primaryLight,
        disabledColor: colors.disabled,
        labelStyle: textStyles.labelM,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(layout.r8)),
        padding: EdgeInsets.symmetric(horizontal: layout.s12, vertical: layout.s4),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surfaceElevated,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(layout.r16)),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colors.surfaceElevated,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(layout.r16)),
        titleTextStyle: textStyles.h3.copyWith(color: colors.textPrimary),
        contentTextStyle: textStyles.bodyM.copyWith(color: colors.textSecondary),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.surface,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.iconSecondary,
        selectedLabelStyle: textStyles.labelS,
        unselectedLabelStyle: textStyles.labelS,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      extensions: [
        AppTextStyleExtension(
          display: textStyles.display,
          h1: textStyles.h1,
          h2: textStyles.h2,
          h3: textStyles.h3,
          bodyL: textStyles.bodyL,
          bodyM: textStyles.bodyM,
          bodyS: textStyles.bodyS,
          labelL: textStyles.labelL,
          labelM: textStyles.labelM,
          labelS: textStyles.labelS,
        ),

        AppLayoutExtension(
          s2: layout.s2,
          s4: layout.s4,
          s6: layout.s6,
          s8: layout.s8,
          s12: layout.s12,
          s16: layout.s16,
          s20: layout.s20,
          s24: layout.s24,
          s32: layout.s32,
          s40: layout.s40,
          s48: layout.s48,
          s64: layout.s64,
          r4: layout.r4,
          r6: layout.r6,
          r8: layout.r8,
          r12: layout.r12,
          r16: layout.r16,
          r24: layout.r24,
          r32: layout.r32,
          r64: layout.r64,
          r100: layout.r100,
        ),

        AppColorsExtension(
          background: colors.background,
          surface: colors.surface,
          surfaceVariant: colors.surfaceVariant,
          surfaceElevated: colors.surfaceElevated,
          onBackground: colors.onBackground,
          onSurface: colors.onSurface,
          primary: colors.primary,
          onPrimary: colors.onPrimary,
          primaryLight: colors.primaryLight,
          divider: colors.divider,
          border: colors.border,
          overlay: colors.overlay,
          staticWhite: colors.staticWhite,
          staticBlack: colors.staticBlack,
          textPrimary: colors.textPrimary,
          textSecondary: colors.textSecondary,
          textTertiary: colors.textTertiary,
          textDisabled: colors.textDisabled,
          textInverted: colors.textInverted,
          iconPrimary: colors.iconPrimary,
          iconSecondary: colors.iconSecondary,
          disabled: colors.disabled,
          success: colors.success,
          error: colors.error,
          warning: colors.warning,
          info: colors.info,
          gray100: colors.gray100,
          gray200: colors.gray200,
          gray300: colors.gray300,
          gray400: colors.gray400,
          gray500: colors.gray500,
          gray600: colors.gray600,
          gray700: colors.gray700,
          gray800: colors.gray800,
          gray900: colors.gray900,
          shimmerBase: colors.shimmerBase,
          shimmerHighlight: colors.shimmerHighlight,
          primaryVariant: colors.primaryVariant,
          accentVariant: colors.accentVariant,
        ),
      ],
    );
  }
}
