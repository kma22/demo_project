import 'dart:async';

/// Контракт сетевого клиента приложения.
/// Описывает базовые методы для выполнения HTTP-запросов.
/// Подробнее: [API_CLIENT_ARCHITECTURE.md](demo_project/docs/API_CLIENT_ARCHITECTURE.md)
abstract interface class BaseApiClient {
  Future<T> get<T>({required String path, Map<String, dynamic>? queryParameters});

  Future<T> post<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  Future<T> put<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  Future<T> patch<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  Future<T> delete<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });
}
