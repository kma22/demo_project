import 'package:demo_project/core/ui_kit/src/theme/app_theme_data.dart';
import 'package:demo_project/core/ui_kit/src/theme/enums/app_theme_type.dart';
import 'package:demo_project/core/ui_kit/src/theme/enums/theme_data_type.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:local_storage/local_storage.dart';

@lazySingleton
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

  Brightness _platformBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;

  void init() {
    final themeName = _localStorage.getTheme();
    if (themeName != null) {
      try {
        _themeTypeController.value = AppThemeType.values.byName(themeName);
      } on Object catch (_) {
        _themeTypeController.value = AppThemeType.system;
      }
    }

    WidgetsBinding.instance.platformDispatcher.onPlatformBrightnessChanged = () {
      _platformBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      if (_themeTypeController.value == AppThemeType.system) {
        // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
        _themeTypeController.notifyListeners();
      }
    };
  }

  ThemeData get currentThemeData => switch (_themeTypeController.value) {
    AppThemeType.system => _getSystemTheme(),
    AppThemeType.dark => _themeData.getTheme(ThemeDataType.dark),
    AppThemeType.light => _themeData.getTheme(ThemeDataType.light),
  };

  ThemeData _getSystemTheme() => switch (_platformBrightness) {
    Brightness.dark => _themeData.getTheme(ThemeDataType.dark),
    Brightness.light => _themeData.getTheme(ThemeDataType.light),
  };
}
