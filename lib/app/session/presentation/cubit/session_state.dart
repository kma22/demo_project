part of 'session_cubit.dart';

/// Состояния сессии приложения.
sealed class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object?> get props => [];
}

class SessionLoadingState extends SessionState {
  const SessionLoadingState();
}

class AuthenticatedState extends SessionState {
  const AuthenticatedState();
}

class UnauthenticatedState extends SessionState {
  final bool sessionExpired;

  const UnauthenticatedState({this.sessionExpired = false});

  @override
  List<Object?> get props => [sessionExpired];
}
