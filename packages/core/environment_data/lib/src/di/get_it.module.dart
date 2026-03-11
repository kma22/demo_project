//@GeneratedMicroModule;EnvironmentDataPackageModule;package:environment_data/src/di/get_it.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:environment_data/src/dev_environment_data.dart' as _i697;
import 'package:environment_data/src/environment_data.dart' as _i1014;
import 'package:environment_data/src/prod_environment_data.dart' as _i327;
import 'package:injectable/injectable.dart' as _i526;

const String _dev = 'dev';
const String _prod = 'prod';

class EnvironmentDataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i1014.EnvironmentData>(
      () => _i697.DevEnvironmentData(),
      registerFor: {_dev},
    );
    gh.factory<_i1014.EnvironmentData>(
      () => _i327.ProdEnvironmentData(),
      registerFor: {_prod},
    );
  }
}
