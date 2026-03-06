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
}
