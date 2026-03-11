import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'login_localizations_en.dart';
import 'login_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of LoginLocalizations
/// returned by `LoginLocalizations.of(context)`.
///
/// Applications need to include `LoginLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/login_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: LoginLocalizations.localizationsDelegates,
///   supportedLocales: LoginLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the LoginLocalizations.supportedLocales
/// property.
abstract class LoginLocalizations {
  LoginLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static LoginLocalizations? of(BuildContext context) {
    return Localizations.of<LoginLocalizations>(context, LoginLocalizations);
  }

  static const LocalizationsDelegate<LoginLocalizations> delegate =
      _LoginLocalizationsDelegate();

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
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// Заголовок экрана логина
  ///
  /// In ru, this message translates to:
  /// **'Вход в аккаунт'**
  String get loginTitle;

  /// Подзаголовок экрана логина
  ///
  /// In ru, this message translates to:
  /// **'Введите данные для входа'**
  String get loginSubtitle;

  /// Лейбл поля email
  ///
  /// In ru, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// Подсказка поля email
  ///
  /// In ru, this message translates to:
  /// **'example@mail.com'**
  String get emailHint;

  /// Лейбл поля пароля
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get passwordLabel;

  /// Подсказка поля пароля
  ///
  /// In ru, this message translates to:
  /// **'Минимум 6 символов'**
  String get passwordHint;

  /// Кнопка входа
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get loginButton;

  /// Ошибка: пустой email
  ///
  /// In ru, this message translates to:
  /// **'Введите email'**
  String get emailEmpty;

  /// Ошибка: невалидный формат email
  ///
  /// In ru, this message translates to:
  /// **'Некорректный email'**
  String get emailInvalid;

  /// Ошибка: пустой пароль
  ///
  /// In ru, this message translates to:
  /// **'Введите пароль'**
  String get passwordEmpty;

  /// Ошибка: слишком короткий пароль
  ///
  /// In ru, this message translates to:
  /// **'Пароль менее 6 символов'**
  String get passwordTooShort;

  /// Текст перед ссылкой на регистрацию
  ///
  /// In ru, this message translates to:
  /// **'Нет аккаунта?'**
  String get noAccount;

  /// Ссылка на экран регистрации
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get signUp;

  /// Общее сообщение об ошибке
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка'**
  String get error;
}

class _LoginLocalizationsDelegate
    extends LocalizationsDelegate<LoginLocalizations> {
  const _LoginLocalizationsDelegate();

  @override
  Future<LoginLocalizations> load(Locale locale) {
    return SynchronousFuture<LoginLocalizations>(
      lookupLoginLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_LoginLocalizationsDelegate old) => false;
}

LoginLocalizations lookupLoginLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return LoginLocalizationsEn();
    case 'ru':
      return LoginLocalizationsRu();
  }

  throw FlutterError(
    'LoginLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
