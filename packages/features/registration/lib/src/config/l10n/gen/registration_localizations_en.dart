// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'registration_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class RegistrationLocalizationsEn extends RegistrationLocalizations {
  RegistrationLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Sign Up';

  @override
  String get subtitle => 'Create an account';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'example@mail.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'At least 6 characters';

  @override
  String get confirmPasswordLabel => 'Confirm password';

  @override
  String get confirmPasswordHint => 'Repeat password';

  @override
  String get registerButton => 'Sign Up';

  @override
  String get emailEmpty => 'Enter email';

  @override
  String get emailInvalid => 'Invalid email';

  @override
  String get passwordEmpty => 'Enter password';

  @override
  String get passwordTooShort => 'Password less than 6 characters';

  @override
  String get passwordNoUppercase => 'At least one uppercase letter required';

  @override
  String get passwordNoLowercase => 'At least one lowercase letter required';

  @override
  String get passwordNoDigit => 'At least one digit required';

  @override
  String get confirmPasswordEmpty => 'Confirm password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get signIn => 'Sign In';

  @override
  String get error => 'An error occurred';
}
