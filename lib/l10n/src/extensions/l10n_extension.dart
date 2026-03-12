import 'package:demo_project/l10n/generated/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension AppL10nExtension on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
