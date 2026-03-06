// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonError => 'An error occurred';

  @override
  String get commonLoading => 'Loading…';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonSave => 'Save';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonClose => 'Close';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonNoResults => 'No results found';

  @override
  String get loginLoginTitle => 'Sign In';

  @override
  String get loginLoginSubtitle => 'Enter your credentials';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginEmailHint => 'example@mail.com';

  @override
  String get loginPasswordLabel => 'Password';

  @override
  String get loginPasswordHint => 'At least 6 characters';

  @override
  String get loginLoginButton => 'Sign In';

  @override
  String get loginEmailEmpty => 'Enter email';

  @override
  String get loginEmailInvalid => 'Invalid email';

  @override
  String get loginPasswordEmpty => 'Enter password';

  @override
  String get loginPasswordTooShort => 'Password less than 6 characters';

  @override
  String get loginNoAccount => 'Don\'t have an account?';

  @override
  String get loginSignUp => 'Sign Up';
}
