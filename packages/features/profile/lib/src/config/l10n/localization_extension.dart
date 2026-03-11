import 'package:flutter/widgets.dart';

import 'package:profile/src/config/l10n/gen/profile_localizations.dart';
import 'package:profile/src/config/l10n/gen/profile_localizations_ru.dart';

extension ProfileLocalizationExtension on BuildContext {
  ProfileLocalizations get l10n => ProfileLocalizations.of(this) ?? ProfileLocalizationsRu();
}
