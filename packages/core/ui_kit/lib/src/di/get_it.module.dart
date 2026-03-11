//@GeneratedMicroModule;UiKitPackageModule;package:ui_kit/src/di/get_it.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:local_storage/local_storage.dart' as _i486;
import 'package:ui_kit/src/theme/app_theme_manager.dart' as _i508;

class UiKitPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i508.AppThemeManager>(
        () => _i508.AppThemeManager(gh<_i486.BaseThemeStorage>()));
  }
}
