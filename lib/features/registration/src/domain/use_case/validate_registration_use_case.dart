import 'package:demo_project/features/registration/src/domain/entity/registration_field.dart';
import 'package:demo_project/features/registration/src/domain/entity/registration_validation_error.dart';
import 'package:injectable/injectable.dart';

@injectable
class ValidateRegistrationUseCase {
  static const _minPasswordLength = 6;
  static final _emailRegExp = RegExp(r'^[\w\-.]+@([\w-]+\.)+[\w-]{2,}$');
  static final _uppercaseRegExp = RegExp('[A-Z]');
  static final _lowercaseRegExp = RegExp('[a-z]');
  static final _digitRegExp = RegExp(r'\d');

  Map<RegistrationField, RegistrationValidationError> call({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    return {
      ..._validateEmail(email.trim()),
      ..._validatePassword(password),
      ..._validateConfirmPassword(password, confirmPassword),
    };
  }

  Map<RegistrationField, RegistrationValidationError> _validateEmail(String email) {
    if (email.isEmpty) return {RegistrationField.email: RegistrationValidationError.empty};

    if (!_emailRegExp.hasMatch(email)) {
      return {RegistrationField.email: RegistrationValidationError.invalidEmail};
    }

    return {};
  }

  Map<RegistrationField, RegistrationValidationError> _validatePassword(String password) {
    if (password.isEmpty) return {RegistrationField.password: RegistrationValidationError.empty};

    if (password.length < _minPasswordLength) {
      return {RegistrationField.password: RegistrationValidationError.passwordTooShort};
    }

    if (!_uppercaseRegExp.hasMatch(password)) {
      return {RegistrationField.password: RegistrationValidationError.passwordNoUppercase};
    }

    if (!_lowercaseRegExp.hasMatch(password)) {
      return {RegistrationField.password: RegistrationValidationError.passwordNoLowercase};
    }

    if (!_digitRegExp.hasMatch(password)) {
      return {RegistrationField.password: RegistrationValidationError.passwordNoDigit};
    }

    return {};
  }

  Map<RegistrationField, RegistrationValidationError> _validateConfirmPassword(
    String password,
    String confirmPassword,
  ) {
    if (confirmPassword.isEmpty) {
      return {RegistrationField.confirmPassword: RegistrationValidationError.empty};
    }

    if (confirmPassword != password) {
      return {RegistrationField.confirmPassword: RegistrationValidationError.passwordsDoNotMatch};
    }

    return {};
  }
}
