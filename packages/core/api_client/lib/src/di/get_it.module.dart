//@GeneratedMicroModule;ApiClientPackageModule;package:api_client/src/di/get_it.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:api_client/src/api_client.dart' as _i190;
import 'package:api_client/src/base_api_client.dart' as _i492;
import 'package:api_client/src/di/dio_module.dart' as _i991;
import 'package:api_client/src/session_observer.dart' as _i398;
import 'package:dio/dio.dart' as _i361;
import 'package:environment_data/environment_data.dart' as _i72;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_storage/local_storage.dart' as _i486;
import 'package:logger_manager/logger_manager.dart' as _i127;

class ApiClientPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final dioModule = _$DioModule();
    gh.lazySingleton<_i398.SessionObserver>(
      () => _i398.SessionObserver(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio(
          gh<_i486.BaseTokenStorage>(),
          gh<_i127.AppLogger>(),
          gh<_i72.EnvironmentData>(),
          gh<_i398.SessionObserver>(),
        ));
    gh.factory<_i492.BaseApiClient>(() => _i190.ApiClient(
          gh<_i361.Dio>(),
          gh<_i127.AppLogger>(),
        ));
  }
}

class _$DioModule extends _i991.DioModule {}
