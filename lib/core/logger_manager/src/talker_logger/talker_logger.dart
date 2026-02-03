import 'package:demo_project/core/logger_manager/src/app_logger.dart';
import 'package:demo_project/core/logger_manager/src/talker_logger/custom_log/w_talker_dio_logger.dart';
import 'package:demo_project/core/logger_manager/src/talker_logger/custom_log/w_talker_error_logger.dart';
import 'package:demo_project/core/logger_manager/src/talker_logger/custom_log/w_talker_info_logger.dart';
import 'package:demo_project/core/logger_manager/src/talker_logger/custom_log/w_talker_warning_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

@LazySingleton(as: AppLogger)
class TalkerLogger implements AppLogger {
  final Talker _talker;

  TalkerLogger(this._talker);

  @override
  void error({
    required Type runtimeType,
    required String operation,
    dynamic msg,
    Object? exc,
    StackTrace? st,
  }) {
    final log = WTalkerErrorLogger(msg, runtimeType, operation, exc, st);
    _talker.logCustom(log);
  }

  @override
  void info(dynamic msg, {required Type runtimeType}) {
    final log = WTalkerInfoLogger(msg, runtimeType);
    _talker.logCustom(log);
  }

  @override
  void warning(dynamic msg, {required Type runtimeType}) {
    final log = WTalkerWarningLogger(msg, runtimeType);
    _talker.logCustom(log);
  }

  @override
  Interceptor get apiLoggerInterceptor => WTalkerDioLogger(_talker);

  @override
  NavigatorObserver get routeLoggerObserver => TalkerRouteObserver(_talker);
}
