//@GeneratedMicroModule;HomePackageModule;package:home/src/config/di/get_it.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:home/src/data/api/base_home_api_service.dart' as _i1058;
import 'package:home/src/data/api/mock_home_api_service.dart' as _i795;
import 'package:home/src/data/repository/home_repository.dart' as _i222;
import 'package:home/src/domain/repository/base_home_repository.dart' as _i355;
import 'package:home/src/presentation/cubit/home_cubit.dart' as _i940;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger_manager/logger_manager.dart' as _i127;

class HomePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i1058.BaseHomeApiService>(() => _i795.MockHomeApiService());
    gh.factory<_i355.BaseHomeRepository>(
        () => _i222.HomeRepository(gh<_i1058.BaseHomeApiService>()));
    gh.factory<_i940.HomeCubit>(() => _i940.HomeCubit(
          gh<_i355.BaseHomeRepository>(),
          gh<_i127.AppLogger>(),
        ));
  }
}
