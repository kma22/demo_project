import 'package:dio/dio.dart';
import 'package:environment_data/environment_data.dart';
import 'package:injectable/injectable.dart';
import 'package:local_storage/local_storage.dart';
import 'package:logger_manager/logger_manager.dart';

import '../interceptors/oauth_interceptor.dart';
import '../session_observer.dart';

/// Модуль инициализации Dio для DI-контейнера.
/// Настраивает базовые опции и цепочку интерцепторов.
/// Подробнее: [API_CLIENT_ARCHITECTURE.md](demo_project/docs/API_CLIENT_ARCHITECTURE.md)
@module
abstract class DioModule {
  Duration get _timeout => const Duration(seconds: 30);

  @lazySingleton
  Dio dio(
    BaseTokenStorage tokenStorage,
    AppLogger logger,
    EnvironmentData environmentData,
    SessionObserver sessionObserver,
  ) {
    final dio = Dio()
      ..options = BaseOptions(
        baseUrl: environmentData.baseUrl,
        connectTimeout: _timeout,
        receiveTimeout: _timeout,
        sendTimeout: _timeout,
      );

    dio.interceptors.addAll([
      logger.apiLoggerInterceptor,
      OauthInterceptor(
        tokenStorage: tokenStorage,
        environmentData: environmentData,
        logger: logger,
        onSessionExpired: () => sessionObserver.emitSessionExpired(),
      ),
    ]);

    return dio;
  }
}
