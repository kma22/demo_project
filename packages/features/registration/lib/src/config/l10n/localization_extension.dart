import 'package:flutter/widgets.dart';

import 'package:registration/src/config/l10n/gen/registration_localizations.dart';
import 'package:registration/src/config/l10n/gen/registration_localizations_ru.dart';

extension RegistrationLocalizationExtension on BuildContext {
  RegistrationLocalizations get l10n =>
      RegistrationLocalizations.of(this) ?? RegistrationLocalizationsRu();
}
