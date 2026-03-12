// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'registration_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class RegistrationLocalizationsRu extends RegistrationLocalizations {
  RegistrationLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get title => 'Регистрация';

  @override
  String get subtitle => 'Создайте аккаунт';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHint => 'example@mail.com';

  @override
  String get passwordLabel => 'Пароль';

  @override
  String get passwordHint => 'Минимум 6 символов';

  @override
  String get confirmPasswordLabel => 'Подтвердите пароль';

  @override
  String get confirmPasswordHint => 'Повторите пароль';

  @override
  String get registerButton => 'Зарегистрироваться';

  @override
  String get emailEmpty => 'Введите email';

  @override
  String get emailInvalid => 'Некорректный email';

  @override
  String get passwordEmpty => 'Введите пароль';

  @override
  String get passwordTooShort => 'Пароль менее 6 символов';

  @override
  String get passwordNoUppercase => 'Нужна хотя бы одна заглавная буква';

  @override
  String get passwordNoLowercase => 'Нужна хотя бы одна строчная буква';

  @override
  String get passwordNoDigit => 'Нужна хотя бы одна цифра';

  @override
  String get confirmPasswordEmpty => 'Подтвердите пароль';

  @override
  String get passwordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get haveAccount => 'Уже есть аккаунт?';

  @override
  String get signIn => 'Войти';

  @override
  String get error => 'Произошла ошибка';
}
