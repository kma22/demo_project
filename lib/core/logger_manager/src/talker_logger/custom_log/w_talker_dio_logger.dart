import 'package:dio/dio.dart';
import 'package:talker/talker.dart';
import 'package:talker_dio_logger/dio_logs.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class WTalkerDioLogger extends Interceptor {
  WTalkerDioLogger(
    this._talker, {
    TalkerDioLoggerSettings settings = const TalkerDioLoggerSettings(),
  }) : _settings = settings;

  static const _kDioLogsTimeStampKey = '_talker_dio_logger_ts_';
  static const _shortLogKey = 'shortLog';
  static const _isShowFullLog = false;

  final Talker _talker;
  TalkerDioLoggerSettings _settings;

  void configure({
    bool? printResponseData,
    bool? printResponseHeaders,
    bool? printResponseMessage,
    bool? printErrorData,
    bool? printErrorHeaders,
    bool? printErrorMessage,
    bool? printRequestData,
    bool? printRequestHeaders,
    bool? printRequestExtra,
    AnsiPen? requestPen,
    AnsiPen? responsePen,
    AnsiPen? errorPen,
  }) {
    _settings = _settings.copyWith(
      printRequestData: printRequestData,
      printRequestHeaders: printRequestHeaders,
      printResponseData: printResponseData,
      printErrorData: printErrorData,
      printErrorHeaders: printErrorHeaders,
      printErrorMessage: printErrorMessage,
      printResponseHeaders: printResponseHeaders,
      printResponseMessage: printResponseMessage,
      printRequestExtra: printRequestExtra,
      requestPen: requestPen,
      responsePen: responsePen,
      errorPen: errorPen,
    );
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_settings.enabled && _settings.printResponseTime) {
      options.extra[_kDioLogsTimeStampKey] = DateTime.now().millisecondsSinceEpoch;
    }

    super.onRequest(options, handler);

    if (!_settings.enabled) return;

    final accepted = _settings.requestFilter?.call(options) ?? true;
    if (!accepted) return;

    try {
      final message = '${options.uri}';

      final isShortLog = options.extra[_shortLogKey];
      if (isShortLog == true && !_isShowFullLog) {
        final shortLog = _getShortLog(message);
        _talker.logCustom(shortLog);
        return;
      }

      final httpLog = DioRequestLog(message, requestOptions: options, settings: _settings);
      _talker.logCustom(httpLog);
    } on Object catch (_) {}
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    if (!_settings.enabled) return;

    final accepted = _settings.responseFilter?.call(response) ?? true;
    if (!accepted) return;

    try {
      final message = '${response.requestOptions.uri}';

      final isShortLog = response.requestOptions.extra[_shortLogKey];
      if (isShortLog == true && !_isShowFullLog) {
        final shortLog = _getShortLog(message);
        _talker.logCustom(shortLog);

        return;
      }

      final httpLog = DioResponseLog(message, settings: _settings, response: response);
      _talker.logCustom(httpLog);
    } on Object catch (_) {}
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (!_settings.enabled) return;

    final accepted = _settings.errorFilter?.call(err) ?? true;
    if (!accepted) return;

    try {
      final message = '${err.requestOptions.uri}';

      final httpErrorLog = DioErrorLog(message, dioException: err, settings: _settings);
      _talker.logCustom(httpErrorLog);
    } on Object catch (_) {}
  }

  TalkerLog _getShortLog(String msg) {
    return TalkerLog(
      'ShortLog: $msg',
      pen: _settings.requestPen ?? (AnsiPen()..xterm(219)),
      logLevel: _settings.logLevel,
    );
  }
}
