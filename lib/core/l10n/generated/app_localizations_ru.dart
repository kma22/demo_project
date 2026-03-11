// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get commonRetry => 'Повторить';

  @override
  String get commonError => 'Произошла ошибка';

  @override
  String get commonLoading => 'Загрузка…';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonDelete => 'Удалить';

  @override
  String get commonEdit => 'Редактировать';

  @override
  String get commonClose => 'Закрыть';

  @override
  String get commonSearch => 'Поиск';

  @override
  String get commonNoResults => 'Ничего не найдено';

  @override
  String get loginLoginTitle => 'Вход в аккаунт';

  @override
  String get loginLoginSubtitle => 'Введите данные для входа';

  @override
  String get loginEmailLabel => 'Email';

  @override
  String get loginEmailHint => 'example@mail.com';

  @override
  String get loginPasswordLabel => 'Пароль';

  @override
  String get loginPasswordHint => 'Минимум 6 символов';

  @override
  String get loginLoginButton => 'Войти';

  @override
  String get loginEmailEmpty => 'Введите email';

  @override
  String get loginEmailInvalid => 'Некорректный email';

  @override
  String get loginPasswordEmpty => 'Введите пароль';

  @override
  String get loginPasswordTooShort => 'Пароль менее 6 символов';

  @override
  String get loginNoAccount => 'Нет аккаунта?';

  @override
  String get loginSignUp => 'Зарегистрироваться';

  @override
  String get registrationTitle => 'Регистрация';

  @override
  String get registrationSubtitle => 'Создайте аккаунт';

  @override
  String get registrationEmailLabel => 'Email';

  @override
  String get registrationEmailHint => 'example@mail.com';

  @override
  String get registrationPasswordLabel => 'Пароль';

  @override
  String get registrationPasswordHint => 'Минимум 6 символов';

  @override
  String get registrationConfirmPasswordLabel => 'Подтвердите пароль';

  @override
  String get registrationConfirmPasswordHint => 'Повторите пароль';

  @override
  String get registrationButton => 'Зарегистрироваться';

  @override
  String get registrationEmailEmpty => 'Введите email';

  @override
  String get registrationEmailInvalid => 'Некорректный email';

  @override
  String get registrationPasswordEmpty => 'Введите пароль';

  @override
  String get registrationPasswordTooShort => 'Пароль менее 6 символов';

  @override
  String get registrationPasswordNoUppercase => 'Нужна хотя бы одна заглавная буква';

  @override
  String get registrationPasswordNoLowercase => 'Нужна хотя бы одна строчная буква';

  @override
  String get registrationPasswordNoDigit => 'Нужна хотя бы одна цифра';

  @override
  String get registrationConfirmPasswordEmpty => 'Подтвердите пароль';

  @override
  String get registrationPasswordsDoNotMatch => 'Пароли не совпадают';

  @override
  String get registrationHaveAccount => 'Уже есть аккаунт?';

  @override
  String get registrationSignIn => 'Войти';

  @override
  String get homeTitle => 'Главная';

  @override
  String get profileTitle => 'Профиль';

  @override
  String get profileLogout => 'Выйти из аккаунта';

  @override
  String get bottomNavHome => 'Главная';

  @override
  String get bottomNavProfile => 'Профиль';
}
