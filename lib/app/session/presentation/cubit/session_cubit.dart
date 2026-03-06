import 'dart:async';

import 'package:demo_project/app/session/domain/base_session_repository.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'session_state.dart';

/// Управляет состоянием авторизации на уровне приложения.
///
/// Слушает [BaseSessionRepository] для проверки сессии при старте
/// и обработки принудительного завершения (401).
@lazySingleton
class SessionCubit extends Cubit<SessionState> {
  final BaseSessionRepository _sessionRepository;
  final AppLogger _logger;

  SessionCubit(this._sessionRepository, this._logger) : super(const SessionLoadingState());

  StreamSubscription<void>? _sessionSub;

  Future<void> init() async {
    _sessionSub = _sessionRepository.onSessionExpired.listen((_) => _handleSessionExpired());

    try {
      final hasSession = await _sessionRepository.hasActiveSession();
      if (hasSession) {
        emit(const AuthenticatedState());
        _logger.info('Session restored', runtimeType: runtimeType);
      } else {
        emit(const UnauthenticatedState());
        _logger.info('No saved session', runtimeType: runtimeType);
      }
    } on Object catch (e, st) {
      _logger.error(runtimeType: runtimeType, operation: 'init', exc: e, st: st);
      emit(const UnauthenticatedState());
    }
  }

  Future<void> onLoginSuccess({required String accessToken, required String refreshToken}) async {
    try {
      await _sessionRepository.saveSession(accessToken, refreshToken);
      emit(const AuthenticatedState());
      _logger.info('Login success', runtimeType: runtimeType);
    } on Object catch (e, st) {
      _logger.error(runtimeType: runtimeType, operation: 'onLoginSuccess', exc: e, st: st);
      emit(const UnauthenticatedState());
    }
  }

  Future<void> logout() async {
    try {
      await _sessionRepository.clearSession();
    } on Object catch (e, st) {
      _logger.error(runtimeType: runtimeType, operation: 'logout', exc: e, st: st);
    }
    emit(const UnauthenticatedState());
    _logger.info('Logged out', runtimeType: runtimeType);
  }

  Future<void> _handleSessionExpired() async {
    if (state is UnauthenticatedState) return;

    _logger.warning('Session expired (401)', runtimeType: runtimeType);
    await _sessionRepository.clearSession();
    emit(const UnauthenticatedState(sessionExpired: true));
  }

  @override
  Future<void> close() async {
    await _sessionSub?.cancel();
    await super.close();
  }
}
