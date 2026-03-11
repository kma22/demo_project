//@GeneratedMicroModule;LoggerManagerPackageModule;package:logger_manager/src/di/get_it.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:logger_manager/src/app_logger.dart' as _i720;
import 'package:logger_manager/src/di/logger_module.dart' as _i167;
import 'package:logger_manager/src/talker_logger/talker_logger.dart' as _i83;
import 'package:talker_flutter/talker_flutter.dart' as _i207;

class LoggerManagerPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final loggerModule = _$LoggerModule();
    gh.lazySingleton<_i207.Talker>(() => loggerModule.talker);
    gh.lazySingleton<_i720.AppLogger>(
        () => _i83.TalkerLogger(gh<_i207.Talker>()));
  }
}

class _$LoggerModule extends _i167.LoggerModule {}
