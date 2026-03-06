import 'package:demo_project/features/registration/src/domain/entity/registration_field.dart';
import 'package:demo_project/features/registration/src/domain/entity/registration_validation_error.dart';
import 'package:injectable/injectable.dart';

@injectable
class ValidateRegistrationUseCase {
  static const _minPasswordLength = 6;
  static final _emailRegExp = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,}$');

  Map<RegistrationField, RegistrationValidationError> call({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    final errors = <RegistrationField, RegistrationValidationError>{};

    _validateEmail(email, errors);
    _validatePassword(password, errors);
    _validateConfirmPassword(password, confirmPassword, errors);

    return errors;
  }

  void _validateEmail(String email, Map<RegistrationField, RegistrationValidationError> errors) {
    if (email.isEmpty) {
      errors[RegistrationField.email] = RegistrationValidationError.empty;
    } else if (!_emailRegExp.hasMatch(email)) {
      errors[RegistrationField.email] = RegistrationValidationError.invalidEmail;
    }
  }

  void _validatePassword(
    String password,
    Map<RegistrationField, RegistrationValidationError> errors,
  ) {
    if (password.isEmpty) {
      errors[RegistrationField.password] = RegistrationValidationError.empty;
    } else if (password.length < _minPasswordLength) {
      errors[RegistrationField.password] = RegistrationValidationError.passwordTooShort;
    } else if (!RegExp('[A-Z]').hasMatch(password)) {
      errors[RegistrationField.password] = RegistrationValidationError.passwordNoUppercase;
    } else if (!RegExp('[a-z]').hasMatch(password)) {
      errors[RegistrationField.password] = RegistrationValidationError.passwordNoLowercase;
    } else if (!RegExp(r'\d').hasMatch(password)) {
      errors[RegistrationField.password] = RegistrationValidationError.passwordNoDigit;
    }
  }

  void _validateConfirmPassword(
    String password,
    String confirmPassword,
    Map<RegistrationField, RegistrationValidationError> errors,
  ) {
    if (confirmPassword.isEmpty) {
      errors[RegistrationField.confirmPassword] = RegistrationValidationError.empty;
    } else if (confirmPassword != password) {
      errors[RegistrationField.confirmPassword] = RegistrationValidationError.passwordsDoNotMatch;
    }
  }
}
