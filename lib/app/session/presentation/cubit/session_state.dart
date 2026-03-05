part of 'session_cubit.dart';

/// Состояния сессии приложения.
sealed class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object?> get props => [];
}

/// Начальное состояние -- токены ещё не проверены.
class SessionLoadingState extends SessionState {
  const SessionLoadingState();
}

/// Пользователь авторизован -- токены валидны.
class AuthenticatedState extends SessionState {
  const AuthenticatedState();
}

/// Пользователь не авторизован -- нет токенов или сессия истекла.
class UnauthenticatedState extends SessionState {
  const UnauthenticatedState({this.sessionExpired = false});

  /// true если сессия была принудительно завершена (401).
  /// Используется для показа уведомления на экране логина.
  final bool sessionExpired;

  @override
  List<Object?> get props => [sessionExpired];
}
