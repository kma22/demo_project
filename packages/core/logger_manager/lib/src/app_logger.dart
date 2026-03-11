import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract interface class AppLogger {
  void info(dynamic msg, {required Type runtimeType});

  void error({
    required Type runtimeType,
    required String operation,
    dynamic msg,
    Object? exc,
    StackTrace? st,
  });

  void warning(dynamic msg, {required Type runtimeType});

  Interceptor get apiLoggerInterceptor;

  NavigatorObserver get routeLoggerObserver;
}
