import 'dart:async';

/// Интерфейс сетевого клиента.
/// Описывает основные методы для работы с API.
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
