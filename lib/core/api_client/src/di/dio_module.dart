import 'package:demo_project/core/api_client/src/interceptors/oauth_interceptor.dart';
import 'package:demo_project/core/api_client/src/session_observer.dart';
import 'package:demo_project/core/local_storage/src/token_storage/base_token_storage.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';
import 'package:dio/dio.dart';
import 'package:environment_data/environment_data.dart';
import 'package:injectable/injectable.dart';

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
