// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'login_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class LoginLocalizationsEn extends LoginLocalizations {
  LoginLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Sign In';

  @override
  String get loginSubtitle => 'Enter your credentials';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'example@mail.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHint => 'At least 6 characters';

  @override
  String get loginButton => 'Sign In';

  @override
  String get emailEmpty => 'Enter email';

  @override
  String get emailInvalid => 'Invalid email';

  @override
  String get passwordEmpty => 'Enter password';

  @override
  String get passwordTooShort => 'Password less than 6 characters';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get error => 'An error occurred';
}
