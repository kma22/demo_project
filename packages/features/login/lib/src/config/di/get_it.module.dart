//@GeneratedMicroModule;LoginPackageModule;package:login/src/config/di/get_it.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:logger_manager/logger_manager.dart' as _i127;
import 'package:login/src/data/api/base_login_api_service.dart' as _i218;
import 'package:login/src/data/api/mock_login_api_service.dart' as _i804;
import 'package:login/src/data/repository/login_repository.dart' as _i842;
import 'package:login/src/domain/repository/base_login_repository.dart'
    as _i931;
import 'package:login/src/presentation/cubit/login_cubit.dart' as _i516;

class LoginPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i218.BaseLoginApiService>(() => _i804.MockLoginApiService());
    gh.factory<_i931.BaseLoginRepository>(
        () => _i842.LoginRepository(gh<_i218.BaseLoginApiService>()));
    gh.factory<_i516.LoginCubit>(() => _i516.LoginCubit(
          gh<_i931.BaseLoginRepository>(),
          gh<_i127.AppLogger>(),
        ));
  }
}
