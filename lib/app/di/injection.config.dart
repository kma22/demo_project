// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:demo_project/app/router/feature_navigation.dart' as _i614;
import 'package:demo_project/app/session/data/session_repository.dart' as _i209;
import 'package:demo_project/app/session/domain/base_session_repository.dart'
    as _i899;
import 'package:demo_project/app/session/presentation/cubit/session_cubit.dart'
    as _i184;
import 'package:demo_project/core/api_client/api_client.dart' as _i112;
import 'package:demo_project/core/api_client/src/api_client.dart' as _i799;
import 'package:demo_project/core/api_client/src/base_api_client.dart' as _i517;
import 'package:demo_project/core/api_client/src/di/dio_module.dart' as _i622;
import 'package:demo_project/core/api_client/src/session_observer.dart'
    as _i834;
import 'package:demo_project/core/environment_data/environment_data.dart'
    as _i281;
import 'package:demo_project/core/environment_data/src/dev_environment_data.dart'
    as _i786;
import 'package:demo_project/core/environment_data/src/environment_data.dart'
    as _i478;
import 'package:demo_project/core/environment_data/src/prod_environment_data.dart'
    as _i88;
import 'package:demo_project/core/local_storage/local_storage.dart' as _i915;
import 'package:demo_project/core/local_storage/src/database/app_database.dart'
    as _i1040;
import 'package:demo_project/core/local_storage/src/di/local_storage_module.dart'
    as _i1006;
import 'package:demo_project/core/local_storage/src/theme_storage/base_theme_storage.dart'
    as _i1035;
import 'package:demo_project/core/local_storage/src/theme_storage/theme_storage.dart'
    as _i411;
import 'package:demo_project/core/local_storage/src/token_storage/base_token_storage.dart'
    as _i386;
import 'package:demo_project/core/local_storage/src/token_storage/token_storage.dart'
    as _i559;
import 'package:demo_project/core/logger_manager/logger_manager.dart' as _i701;
import 'package:demo_project/core/logger_manager/src/app_logger.dart' as _i701;
import 'package:demo_project/core/logger_manager/src/di/logger_module.dart'
    as _i922;
import 'package:demo_project/core/logger_manager/src/talker_logger/talker_logger.dart'
    as _i37;
import 'package:demo_project/core/routing/src/navigation/base_feature_navigation.dart'
    as _i763;
import 'package:demo_project/core/ui_kit/src/theme/app_theme_manager.dart'
    as _i492;
import 'package:demo_project/features/auth/src/data/api/base_auth_api_service.dart'
    as _i691;
import 'package:demo_project/features/auth/src/data/api/mock_auth_api_service.dart'
    as _i789;
import 'package:demo_project/features/auth/src/data/repository/auth_repository.dart'
    as _i14;
import 'package:demo_project/features/auth/src/domain/repository/base_auth_repository.dart'
    as _i555;
import 'package:demo_project/features/auth/src/presentation/cubit/login_cubit.dart'
    as _i878;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

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
    gh.singleton<_i1040.AppDatabase>(() => _i1040.AppDatabase());
    gh.lazySingleton<_i834.SessionObserver>(
      () => _i834.SessionObserver(),
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
    gh.lazySingleton<_i701.AppLogger>(
      () => _i37.TalkerLogger(gh<_i207.Talker>()),
    );
    gh.factory<_i691.BaseAuthApiService>(() => _i789.MockAuthApiService());
    gh.factory<_i555.BaseAuthRepository>(
      () => _i14.AuthRepository(gh<_i691.BaseAuthApiService>()),
    );
    gh.factory<_i478.EnvironmentData>(
      () => _i786.DevEnvironmentData(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i763.BaseFeatureNavigation>(
      () => _i614.FeatureNavigation(),
    );
    gh.factory<_i1035.BaseThemeStorage>(
      () => _i411.ThemeStorage(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i386.BaseTokenStorage>(
      () => _i559.TokenStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i478.EnvironmentData>(
      () => _i88.ProdEnvironmentData(),
      registerFor: {_prod},
    );
    gh.factory<_i878.LoginCubit>(
      () => _i878.LoginCubit(
        gh<_i555.BaseAuthRepository>(),
        gh<_i701.AppLogger>(),
      ),
    );
    gh.factory<_i492.AppThemeManager>(
      () => _i492.AppThemeManager(gh<_i915.BaseThemeStorage>()),
    );
    gh.lazySingleton<_i899.BaseSessionRepository>(
      () => _i209.SessionRepository(
        gh<_i915.BaseTokenStorage>(),
        gh<_i112.SessionObserver>(),
      ),
    );
    gh.lazySingleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i386.BaseTokenStorage>(),
        gh<_i701.AppLogger>(),
        gh<_i281.EnvironmentData>(),
        gh<_i834.SessionObserver>(),
      ),
    );
    gh.factory<_i517.BaseApiClient>(
      () => _i799.ApiClient(gh<_i361.Dio>(), gh<_i701.AppLogger>()),
    );
    gh.lazySingleton<_i184.SessionCubit>(
      () => _i184.SessionCubit(
        gh<_i899.BaseSessionRepository>(),
        gh<_i701.AppLogger>(),
      ),
    );
    return this;
  }
}

class _$LocalStorageModule extends _i1006.LocalStorageModule {}

class _$LoggerModule extends _i922.LoggerModule {}

class _$DioModule extends _i622.DioModule {}
