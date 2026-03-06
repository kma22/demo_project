import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('ru')];

  /// Кнопка повторной попытки
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get commonRetry;

  /// Общее сообщение об ошибке
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка'**
  String get commonError;

  /// Текст состояния загрузки
  ///
  /// In ru, this message translates to:
  /// **'Загрузка…'**
  String get commonLoading;

  /// Кнопка отмены
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get commonCancel;

  /// Кнопка сохранения
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get commonSave;

  /// Кнопка удаления
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get commonDelete;

  /// Кнопка редактирования
  ///
  /// In ru, this message translates to:
  /// **'Редактировать'**
  String get commonEdit;

  /// Кнопка закрытия
  ///
  /// In ru, this message translates to:
  /// **'Закрыть'**
  String get commonClose;

  /// Поле/кнопка поиска
  ///
  /// In ru, this message translates to:
  /// **'Поиск'**
  String get commonSearch;

  /// Пустой результат поиска
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get commonNoResults;

  /// Заголовок экрана логина
  ///
  /// In ru, this message translates to:
  /// **'Вход в аккаунт'**
  String get authLoginTitle;

  /// Подзаголовок экрана логина
  ///
  /// In ru, this message translates to:
  /// **'Введите данные для входа'**
  String get authLoginSubtitle;

  /// Лейбл поля email
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get authEmailLabel;

  /// Подсказка поля email
  ///
  /// In ru, this message translates to:
  /// **'example@mail.com'**
  String get authEmailHint;

  /// Лейбл поля пароля
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get authPasswordLabel;

  /// Подсказка поля пароля
  ///
  /// In ru, this message translates to:
  /// **'Минимум 6 символов'**
  String get authPasswordHint;

  /// Кнопка входа
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get authLoginButton;

  /// Ошибка: пустой email
  ///
  /// In ru, this message translates to:
  /// **'Введите email'**
  String get authEmailEmpty;

  /// Ошибка: невалидный формат email
  ///
  /// In ru, this message translates to:
  /// **'Некорректный email'**
  String get authEmailInvalid;

  /// Ошибка: пустой пароль
  ///
  /// In ru, this message translates to:
  /// **'Введите пароль'**
  String get authPasswordEmpty;

  /// Ошибка: слишком короткий пароль
  ///
  /// In ru, this message translates to:
  /// **'Пароль менее 6 символов'**
  String get authPasswordTooShort;

  /// Текст перед ссылкой на регистрацию
  ///
  /// In ru, this message translates to:
  /// **'Нет аккаунта?'**
  String get authNoAccount;

  /// Ссылка на экран регистрации
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get authSignUp;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
