import 'dart:async';

import 'package:dio/dio.dart';
import 'package:environment_data/environment_data.dart';
import 'package:flutter/widgets.dart';
import 'package:local_storage/local_storage.dart';
import 'package:logger_manager/logger_manager.dart';

/// Интерцептор для управления авторизацией.
/// Добавляет токены к запросам и обрабатывает автоматическое обновление при 401 ошибке.
/// Подробнее: [API_CLIENT_ARCHITECTURE.md](demo_project/docs/API_CLIENT_ARCHITECTURE.md)
class OauthInterceptor extends Interceptor {
  static const _authHeader = 'Authorization';
  static const _authHeaderPart = 'Bearer';
  static const _notAuthorizedStatusCode = 401;
  static const _refreshPath = '/v1/auth/refresh';

  final BaseTokenStorage _tokenStorage;
  final EnvironmentData _environmentData;
  final VoidCallback _onSessionExpired;
  final AppLogger _logger;

  OauthInterceptor({
    required BaseTokenStorage tokenStorage,
    required EnvironmentData environmentData,
    required AppLogger logger,
    required VoidCallback onSessionExpired,
  }) : _tokenStorage = tokenStorage,
       _environmentData = environmentData,
       _logger = logger,
       _onSessionExpired = onSessionExpired {
    _internalDio = Dio();
    _internalDio.interceptors.addAll([_logger.apiLoggerInterceptor]);
  }

  bool _isRefreshing = false;
  final List<_QueuedRequest> _queuedRequests = [];
  late Dio _internalDio;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final tokens = await _tokenStorage.getTokens();
    if (tokens != null) {
      final authorizationValue = '$_authHeaderPart ${tokens.accessToken}';
      options.headers[_authHeader] = authorizationValue;
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != _notAuthorizedStatusCode) {
      return super.onError(err, handler);
    }

    _infoLog('Received $_notAuthorizedStatusCode, checking refresh flow');

    _queuedRequests.add(_QueuedRequest.fromError(err, handler));

    if (_isRefreshing) {
      _infoLog('Already refreshing token, queued current request');
      return;
    }

    _isRefreshing = true;

    try {
      final (refresh, access) = await refreshToken();
      await _saveTokens(refresh, access);

      await _processQueuedRequests();
    } on Object catch (_) {
      _failQueuedRequests(err);
      _onSessionExpired();
    } finally {
      _isRefreshing = false;
    }
  }

  Future<(String, String)> refreshToken() async {
    const refreshTokenKey = 'refreshToken';
    const oldAccessTokenKey = 'oldAccessToken';

    for (var i = 0; i < 3; i++) {
      _infoLog('Trying to refresh token');
      final tokens = await _tokenStorage.getTokens();

      if (tokens == null) {
        _errorLog('Missing tokens, logout');
        throw Exception('Missing tokens, logout');
      }

      try {
        final response = await _internalDio.post<Map<String, dynamic>>(
          '${_environmentData.baseUrl}$_refreshPath',
          data: {refreshTokenKey: tokens.refreshToken, oldAccessTokenKey: tokens.accessToken},
        );

        final newTokens = _extractTokens(response.data);

        if (newTokens != null) {
          _infoLog('Success refreshing token');
          return newTokens;
        }
      } on DioException catch (e, st) {
        _errorLog('Get exception while refreshing token, trying new', e, st);

        if (e.response?.statusCode == _notAuthorizedStatusCode) {
          _errorLog('Refresh token is expired, logout', e, st);
          throw Exception('Refresh token is expired, logout');
        }

        await Future.delayed(const Duration(milliseconds: 500));
      } on Exception catch (e, st) {
        _errorLog('Get exception while refreshing token, trying new', e, st);
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }

    _errorLog('Failed to refresh tokens');
    throw Exception('Failed to refresh tokens');
  }

  (String, String)? _extractTokens(Map<String, dynamic>? data) {
    const accessTokenKey = 'accessToken';
    const refreshTokenKey = 'refreshToken';
    const dataKey = 'data';
    final responseData = data?[dataKey];

    if (responseData is Map<String, dynamic>) {
      final refreshToken = responseData[refreshTokenKey];
      final accessToken = responseData[accessTokenKey];

      if (refreshToken is String && accessToken is String) {
        return (refreshToken, accessToken);
      }
    }

    return null;
  }

  Future<void> _saveTokens(String refreshToken, String accessToken) async {
    _logger.info('SaveTokens to storage', runtimeType: runtimeType);
    await _tokenStorage.saveTokens(accessToken, refreshToken);
  }

  Future<void> _processQueuedRequests() async {
    _infoLog('Processing ${_queuedRequests.length} queued requests');

    final tokens = await _tokenStorage.getTokens();
    if (tokens != null) {
      final authorizationValue = '$_authHeaderPart ${tokens.accessToken}';

      final authHeader = {_authHeader: authorizationValue};

      for (final queued in _queuedRequests) {
        queued.execute(_internalDio, authHeader);
      }
    }

    _queuedRequests.clear();
  }

  void _failQueuedRequests(DioException originalError) {
    for (final request in _queuedRequests) {
      request.reject(originalError);
    }
    _queuedRequests.clear();
  }

  void _infoLog(String msg) {
    _logger.info('[RefreshTokenFlow] $msg', runtimeType: runtimeType);
  }

  void _errorLog(String msg, [Object? exc, StackTrace? st, String? operation]) {
    _logger.error(
      runtimeType: runtimeType,
      operation: operation ?? 'refreshToken',
      msg: '[RefreshTokenFlow] $msg',
      exc: exc,
      st: st,
    );
  }
}

class _QueuedRequest {
  final RequestOptions options;
  final void Function(Response response) resolve;
  final void Function(DioException error) reject;

  const _QueuedRequest({required this.options, required this.resolve, required this.reject});

  factory _QueuedRequest.fromError(DioException err, ErrorInterceptorHandler handler) {
    return _QueuedRequest(
      options: err.requestOptions,
      resolve: handler.resolve,
      reject: handler.reject,
    );
  }

  void execute(Dio dio, Map<String, String> updatedHeaders) {
    final updatedOptions = options.copyWith(headers: {...options.headers, ...updatedHeaders});

    dio
        .fetch(updatedOptions)
        .then(resolve)
        .catchError(
          (e) => reject(
            e is DioException ? e : DioException(requestOptions: updatedOptions, error: e),
          ),
        );
  }
}
