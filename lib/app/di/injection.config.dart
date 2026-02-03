// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

import '../../core/api_client/src/api_client.dart' as _i641;
import '../../core/api_client/src/base_api_client.dart' as _i486;
import '../../core/api_client/src/di/dio_module.dart' as _i364;
import '../../core/api_client/src/session_observer.dart' as _i1056;
import '../../core/environment_data/environment_data.dart' as _i926;
import '../../core/environment_data/src/dev_environment_data.dart' as _i783;
import '../../core/environment_data/src/environment_data.dart' as _i84;
import '../../core/environment_data/src/prod_environment_data.dart' as _i968;
import '../../core/local_storage/src/database/app_database.dart' as _i216;
import '../../core/local_storage/src/di/local_storage_module.dart' as _i924;
import '../../core/local_storage/src/token_storage/base_token_storage.dart'
    as _i476;
import '../../core/local_storage/src/token_storage/token_storage.dart' as _i458;
import '../../core/logger_manager/logger_manager.dart' as _i522;
import '../../core/logger_manager/src/app_logger.dart' as _i101;
import '../../core/logger_manager/src/di/logger_module.dart' as _i248;
import '../../core/logger_manager/src/talker_logger/talker_logger.dart' as _i25;
import '../../core/routing/src/navigation/base_feature_navigation.dart'
    as _i206;
import '../router/feature_navigation.dart' as _i123;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final localStorageModule = _$LocalStorageModule();
    final loggerModule = _$LoggerModule();
    final dioModule = _$DioModule();
    gh.singleton<_i216.AppDatabase>(() => _i216.AppDatabase());
    gh.lazySingleton<_i1056.SessionObserver>(
      () => _i1056.SessionObserver(),
      dispose: (i) => i.dispose(),
    );
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => localStorageModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => localStorageModule.secureStorage,
    );
    gh.lazySingleton<_i207.Talker>(() => loggerModule.talker);
    gh.lazySingleton<_i101.AppLogger>(
      () => _i25.TalkerLogger(gh<_i207.Talker>()),
    );
    gh.factory<_i84.EnvironmentData>(
      () => _i783.DevEnvironmentData(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i206.BaseFeatureNavigation>(
      () => _i123.FeatureNavigation(),
    );
    gh.lazySingleton<_i476.BaseTokenStorage>(
      () => _i458.TokenStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i84.EnvironmentData>(
      () => _i968.ProdEnvironmentData(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i476.BaseTokenStorage>(),
        gh<_i522.AppLogger>(),
        gh<_i926.EnvironmentData>(),
        gh<_i1056.SessionObserver>(),
      ),
    );
    gh.factory<_i486.BaseApiClient>(
      () => _i641.ApiClient(gh<_i361.Dio>(), gh<_i522.AppLogger>()),
    );
    return this;
  }
}

class _$LocalStorageModule extends _i924.LocalStorageModule {}

class _$LoggerModule extends _i248.LoggerModule {}

class _$DioModule extends _i364.DioModule {}
