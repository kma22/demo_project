part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();
}

class LoginSuccessState extends LoginState {
  final String accessToken;
  final String refreshToken;

  const LoginSuccessState({required this.accessToken, required this.refreshToken});

  @override
  List<Object?> get props => [accessToken, refreshToken];
}

class LoginErrorState extends LoginState {
  final String? message;

  const LoginErrorState({this.message});

  @override
  List<Object?> get props => [message];
}
