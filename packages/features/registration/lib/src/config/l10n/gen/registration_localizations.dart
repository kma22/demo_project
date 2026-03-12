import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'registration_localizations_en.dart';
import 'registration_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of RegistrationLocalizations
/// returned by `RegistrationLocalizations.of(context)`.
///
/// Applications need to include `RegistrationLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/registration_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: RegistrationLocalizations.localizationsDelegates,
///   supportedLocales: RegistrationLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the RegistrationLocalizations.supportedLocales
/// property.
abstract class RegistrationLocalizations {
  RegistrationLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static RegistrationLocalizations? of(BuildContext context) {
    return Localizations.of<RegistrationLocalizations>(
      context,
      RegistrationLocalizations,
    );
  }

  static const LocalizationsDelegate<RegistrationLocalizations> delegate =
      _RegistrationLocalizationsDelegate();

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

  /// Заголовок экрана регистрации
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get title;

  /// Подзаголовок экрана регистрации
  ///
  /// In ru, this message translates to:
  /// **'Создайте аккаунт'**
  String get subtitle;

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

  /// Лейбл поля подтверждения пароля
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите пароль'**
  String get confirmPasswordLabel;

  /// Подсказка поля подтверждения пароля
  ///
  /// In ru, this message translates to:
  /// **'Повторите пароль'**
  String get confirmPasswordHint;

  /// Кнопка регистрации
  ///
  /// In ru, this message translates to:
  /// **'Зарегистрироваться'**
  String get registerButton;

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

  /// Ошибка: нет заглавной буквы
  ///
  /// In ru, this message translates to:
  /// **'Нужна хотя бы одна заглавная буква'**
  String get passwordNoUppercase;

  /// Ошибка: нет строчной буквы
  ///
  /// In ru, this message translates to:
  /// **'Нужна хотя бы одна строчная буква'**
  String get passwordNoLowercase;

  /// Ошибка: нет цифры
  ///
  /// In ru, this message translates to:
  /// **'Нужна хотя бы одна цифра'**
  String get passwordNoDigit;

  /// Ошибка: пустое подтверждение пароля
  ///
  /// In ru, this message translates to:
  /// **'Подтвердите пароль'**
  String get confirmPasswordEmpty;

  /// Ошибка: пароли не совпадают
  ///
  /// In ru, this message translates to:
  /// **'Пароли не совпадают'**
  String get passwordsDoNotMatch;

  /// Текст перед ссылкой на вход
  ///
  /// In ru, this message translates to:
  /// **'Уже есть аккаунт?'**
  String get haveAccount;

  /// Ссылка на экран входа
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get signIn;

  /// Общее сообщение об ошибке
  ///
  /// In ru, this message translates to:
  /// **'Произошла ошибка'**
  String get error;
}

class _RegistrationLocalizationsDelegate
    extends LocalizationsDelegate<RegistrationLocalizations> {
  const _RegistrationLocalizationsDelegate();

  @override
  Future<RegistrationLocalizations> load(Locale locale) {
    return SynchronousFuture<RegistrationLocalizations>(
      lookupRegistrationLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_RegistrationLocalizationsDelegate old) => false;
}

RegistrationLocalizations lookupRegistrationLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return RegistrationLocalizationsEn();
    case 'ru':
      return RegistrationLocalizationsRu();
  }

  throw FlutterError(
    'RegistrationLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
