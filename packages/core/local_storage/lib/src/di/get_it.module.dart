//@GeneratedMicroModule;LocalStoragePackageModule;package:local_storage/src/di/get_it.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_storage/src/database/app_database.dart' as _i504;
import 'package:local_storage/src/di/local_storage_module.dart' as _i248;
import 'package:local_storage/src/theme_storage/base_theme_storage.dart'
    as _i199;
import 'package:local_storage/src/theme_storage/theme_storage.dart' as _i759;
import 'package:local_storage/src/token_storage/base_token_storage.dart'
    as _i863;
import 'package:local_storage/src/token_storage/token_storage.dart' as _i859;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

class LocalStoragePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final localStorageModule = _$LocalStorageModule();
    gh.singleton<_i504.AppDatabase>(() => _i504.AppDatabase());
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => localStorageModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => localStorageModule.secureStorage);
    gh.lazySingleton<_i863.BaseTokenStorage>(
        () => _i859.TokenStorage(gh<_i558.FlutterSecureStorage>()));
    gh.factory<_i199.BaseThemeStorage>(
        () => _i759.ThemeStorage(gh<_i460.SharedPreferences>()));
  }
}

class _$LocalStorageModule extends _i248.LocalStorageModule {}
