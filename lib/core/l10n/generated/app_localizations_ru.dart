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
  String get authLoginTitle => 'Вход в аккаунт';

  @override
  String get authLoginSubtitle => 'Введите данные для входа';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailHint => 'example@mail.com';

  @override
  String get authPasswordLabel => 'Пароль';

  @override
  String get authPasswordHint => 'Минимум 6 символов';

  @override
  String get authLoginButton => 'Войти';

  @override
  String get authEmailEmpty => 'Введите email';

  @override
  String get authEmailInvalid => 'Некорректный email';

  @override
  String get authPasswordEmpty => 'Введите пароль';

  @override
  String get authPasswordTooShort => 'Минимум 6 символов';

  @override
  String get authNoAccount => 'Нет аккаунта?';

  @override
  String get authSignUp => 'Зарегистрироваться';
}
