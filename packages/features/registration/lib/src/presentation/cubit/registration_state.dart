part of 'registration_cubit.dart';

sealed class RegistrationState extends Equatable {
  final Map<RegistrationField, RegistrationValidationError> fieldErrors;

  const RegistrationState({this.fieldErrors = const {}});

  @override
  List<Object?> get props => [fieldErrors];
}

class RegistrationFormState extends RegistrationState {
  const RegistrationFormState({super.fieldErrors});
}

class RegistrationLoadingState extends RegistrationState {
  const RegistrationLoadingState();
}

class RegistrationSuccessState extends RegistrationState {
  final String accessToken;
  final String refreshToken;

  const RegistrationSuccessState({required this.accessToken, required this.refreshToken});

  @override
  List<Object?> get props => [accessToken, refreshToken];
}

class RegistrationErrorState extends RegistrationState {
  final String? message;

  const RegistrationErrorState({this.message});

  @override
  List<Object?> get props => [message];
}
