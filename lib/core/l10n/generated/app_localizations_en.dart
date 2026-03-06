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
  String get authLoginTitle => 'Sign In';

  @override
  String get authLoginSubtitle => 'Enter your credentials';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailHint => 'example@mail.com';

  @override
  String get authPasswordLabel => 'Password';

  @override
  String get authPasswordHint => 'At least 6 characters';

  @override
  String get authLoginButton => 'Sign In';

  @override
  String get authEmailEmpty => 'Enter email';

  @override
  String get authEmailInvalid => 'Invalid email';

  @override
  String get authPasswordEmpty => 'Enter password';

  @override
  String get authPasswordTooShort => 'At least 6 characters';
}
