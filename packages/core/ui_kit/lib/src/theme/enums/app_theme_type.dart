import 'package:flutter/material.dart';

enum AppThemeType {
  system,
  light,
  dark;

  ThemeMode toThemeMode() => switch (this) {
    AppThemeType.dark => ThemeMode.dark,
    AppThemeType.light => ThemeMode.light,
    AppThemeType.system => ThemeMode.system,
  };
}
