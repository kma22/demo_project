import 'package:flutter/widgets.dart';

import 'package:login/src/config/l10n/gen/login_localizations.dart';
import 'package:login/src/config/l10n/gen/login_localizations_ru.dart';

extension LoginLocalizationExtension on BuildContext {
  LoginLocalizations get l10n => LoginLocalizations.of(this) ?? LoginLocalizationsRu();
}
