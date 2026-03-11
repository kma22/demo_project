// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'login_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class LoginLocalizationsRu extends LoginLocalizations {
  LoginLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get loginTitle => 'Вход в аккаунт';

  @override
  String get loginSubtitle => 'Введите данные для входа';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'example@mail.com';

  @override
  String get passwordLabel => 'Пароль';

  @override
  String get passwordHint => 'Минимум 6 символов';

  @override
  String get loginButton => 'Войти';

  @override
  String get emailEmpty => 'Введите email';

  @override
  String get emailInvalid => 'Некорректный email';

  @override
  String get passwordEmpty => 'Введите пароль';

  @override
  String get passwordTooShort => 'Пароль менее 6 символов';

  @override
  String get noAccount => 'Нет аккаунта?';

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get error => 'Произошла ошибка';
}
