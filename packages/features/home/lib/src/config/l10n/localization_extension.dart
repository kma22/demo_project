import 'package:flutter/widgets.dart';

import 'package:home/src/config/l10n/gen/home_localizations.dart';
import 'package:home/src/config/l10n/gen/home_localizations_ru.dart';

extension HomeLocalizationExtension on BuildContext {
  HomeLocalizations get l10n => HomeLocalizations.of(this) ?? HomeLocalizationsRu();
}
