//@GeneratedMicroModule;RegistrationPackageModule;package:registration/src/config/di/get_it.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:logger_manager/logger_manager.dart' as _i127;
import 'package:registration/src/data/api/base_registration_api_service.dart'
    as _i696;
import 'package:registration/src/data/api/mock_registration_api_service.dart'
    as _i253;
import 'package:registration/src/data/repository/registration_repository.dart'
    as _i428;
import 'package:registration/src/domain/repository/base_registration_repository.dart'
    as _i602;
import 'package:registration/src/domain/use_case/register_use_case.dart'
    as _i887;
import 'package:registration/src/domain/use_case/validate_registration_use_case.dart'
    as _i263;
import 'package:registration/src/presentation/cubit/registration_cubit.dart'
    as _i1058;

class RegistrationPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i263.ValidateRegistrationUseCase>(
        () => _i263.ValidateRegistrationUseCase());
    gh.factory<_i696.BaseRegistrationApiService>(
        () => _i253.MockRegistrationApiService());
    gh.factory<_i602.BaseRegistrationRepository>(() =>
        _i428.RegistrationRepository(gh<_i696.BaseRegistrationApiService>()));
    gh.factory<_i887.RegisterUseCase>(
        () => _i887.RegisterUseCase(gh<_i602.BaseRegistrationRepository>()));
    gh.factory<_i1058.RegistrationCubit>(() => _i1058.RegistrationCubit(
          gh<_i263.ValidateRegistrationUseCase>(),
          gh<_i887.RegisterUseCase>(),
          gh<_i127.AppLogger>(),
        ));
  }
}
