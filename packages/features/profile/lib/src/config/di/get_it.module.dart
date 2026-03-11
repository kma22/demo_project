//@GeneratedMicroModule;ProfilePackageModule;package:profile/src/config/di/get_it.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:logger_manager/logger_manager.dart' as _i127;
import 'package:profile/src/data/api/base_profile_api_service.dart' as _i629;
import 'package:profile/src/data/api/mock_profile_api_service.dart' as _i184;
import 'package:profile/src/data/repository/profile_repository.dart' as _i172;
import 'package:profile/src/domain/repository/base_profile_repository.dart'
    as _i785;
import 'package:profile/src/presentation/cubit/profile_cubit.dart' as _i527;

class ProfilePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i629.BaseProfileApiService>(
        () => _i184.MockProfileApiService());
    gh.factory<_i785.BaseProfileRepository>(
        () => _i172.ProfileRepository(gh<_i629.BaseProfileApiService>()));
    gh.factory<_i527.ProfileCubit>(() => _i527.ProfileCubit(
          gh<_i785.BaseProfileRepository>(),
          gh<_i127.AppLogger>(),
        ));
  }
}
