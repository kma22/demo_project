import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger_manager/logger_manager.dart';

import 'base_api_client.dart';
import 'exceptions/bad_request_exception.dart';
import 'exceptions/connection_exception.dart';
import 'exceptions/invalid_data_exception.dart';
import 'exceptions/not_found_exception.dart';
import 'exceptions/server_error_exception.dart';
import 'exceptions/timeout_exception.dart';
import 'exceptions/unauthorized_exception.dart';
import 'exceptions/unknown_api_exception.dart';

/// Реализация [BaseApiClient] на базе Dio.
/// Подробнее: [API_CLIENT_ARCHITECTURE.md](demo_project/docs/API_CLIENT_ARCHITECTURE.md)
@Injectable(as: BaseApiClient)
class ApiClient implements BaseApiClient {
  final Dio _dio;
  final AppLogger _logger;

  ApiClient(this._dio, this._logger);

  @override
  Future<T> get<T>({required String path, Map<String, dynamic>? queryParameters}) {
    final response = _dio.get(path, queryParameters: queryParameters);
    return _handleResponse(response);
  }

  @override
  Future<T> post<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) {
    final response = _dio.post(path, queryParameters: queryParameters, data: data);

    return _handleResponse(response);
  }

  @override
  Future<T> put<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) {
    final response = _dio.put(path, queryParameters: queryParameters, data: data);

    return _handleResponse(response);
  }

  @override
  Future<T> patch<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) {
    final response = _dio.patch(path, queryParameters: queryParameters, data: data);

    return _handleResponse(response);
  }

  @override
  Future<T> delete<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) {
    final response = _dio.delete(path, queryParameters: queryParameters, data: data);

    return _handleResponse(response);
  }

  Future<T> _handleResponse<T>(Future<Response> response) async {
    try {
      final data = (await response).data;

      if (data is T) {
        return data;
      } else {
        throw InvalidDataException();
      }
    } on DioException catch (e) {
      _handleDioException(e);
    } on SocketException catch (e, st) {
      _logger.error(
        runtimeType: runtimeType,
        operation: '_handleResponse',
        msg: 'Network connection error',
        exc: e,
        st: st,
      );

      throw ConnectionException();
    } on InvalidDataException {
      rethrow;
    } on Exception catch (e, st) {
      _logger.error(
        runtimeType: runtimeType,
        operation: '_handleResponse',
        msg: 'Unhandled API error',
        exc: e,
        st: st,
      );
      rethrow;
    }
  }

  Never _handleDioException(DioException e) {
    final errorMessage = _processErrorMessage(e);
    final errorCode = _processErrorCode(e);
    const timeoutErrorMessage = 'Request timed out. Please check your connection and try again.';

    switch (e.type) {
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        throw AppTimeoutException(timeoutErrorMessage, errorCode);
      default:
        switch (e.response?.statusCode) {
          case 400:
            throw BadRequestException(errorMessage, errorCode);
          case 401:
          case 403:
            throw UnauthorizedException(errorMessage, errorCode);
          case 404:
          case 405:
            throw NotFoundException(errorMessage, errorCode);
          case 408:
            throw AppTimeoutException(errorMessage, errorCode);
          case 500:
          case 502:
          case 503:
            throw ServerErrorException(errorMessage, errorCode);
          default:
            throw UnknownApiException(errorMessage, errorCode, statusCode: e.response?.statusCode);
        }
    }
  }

  String? _processErrorMessage(DioException e) {
    const errorMessageKey = 'message';
    const errorKey = 'error';

    final responseData = e.response?.data;

    if (responseData is Map<String, dynamic>) {
      final errorField = responseData[errorKey];

      if (errorField is Map<String, dynamic>) {
        final errorMessage = errorField[errorMessageKey];
        return errorMessage is String ? errorMessage : null;
      }

      final topLevelMessage = responseData[errorMessageKey];
      return topLevelMessage is String ? topLevelMessage : null;
    }

    return null;
  }

  String? _processErrorCode(DioException e) {
    const errorCodeKey = 'codeName';
    const errorKey = 'error';

    final responseData = e.response?.data;

    if (responseData is Map<String, dynamic>) {
      final errorField = responseData[errorKey];

      if (errorField is Map<String, dynamic>) {
        final code = errorField[errorCodeKey];
        if (code is String) return code;
      }

      final topLevelCode = responseData[errorCodeKey];
      if (topLevelCode is String) return topLevelCode;
    }

    return null;
  }
}
