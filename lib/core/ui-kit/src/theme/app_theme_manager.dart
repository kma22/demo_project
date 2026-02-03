import 'package:demo_project/core/local_storage/local_storage.dart';
import 'package:demo_project/core/ui-kit/src/theme/app_theme_data.dart';
import 'package:demo_project/core/ui-kit/src/theme/enums/app_theme_type.dart';
import 'package:demo_project/core/ui-kit/src/theme/enums/theme_data_type.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppThemeManager {
  final BaseThemeStorage _localStorage;

  AppThemeManager(this._localStorage);

  ValueNotifier<AppThemeType> get controller => _themeTypeController;

  AppThemeType get currentTheme => _themeTypeController.value;

  set changeTheme(AppThemeType value) {
    _themeTypeController.value = value;
    _localStorage.saveTheme(value.name);
  }

  final _themeTypeController = ValueNotifier<AppThemeType>(AppThemeType.system);
  final _themeData = AppThemeData();

  void init() {
    final themeName = _localStorage.getTheme();
    if (themeName == null) {
      _themeTypeController.value = AppThemeType.system;
    } else {
      _themeTypeController.value = AppThemeType.values.byName(themeName);
    }
  }

  ThemeData theme(Brightness platformBrightness) => switch (_themeTypeController.value) {
    AppThemeType.system => _getSystemTheme(platformBrightness),
    AppThemeType.dark => _themeData.getTheme(ThemeDataType.dark),
    AppThemeType.light => _themeData.getTheme(ThemeDataType.light),
  };

  ThemeData _getSystemTheme(Brightness platformBrightness) => switch (platformBrightness) {
    Brightness.dark => _themeData.getTheme(ThemeDataType.dark),
    Brightness.light => _themeData.getTheme(ThemeDataType.light),
  };
}
