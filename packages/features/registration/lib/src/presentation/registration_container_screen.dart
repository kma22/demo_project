import 'package:flutter/material.dart';
import 'package:routing/routing.dart';

import 'package:registration/src/config/l10n/gen/registration_localizations.dart';

@RoutePage()
class RegistrationContainerScreen extends StatelessWidget {
  const RegistrationContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      delegates: const [RegistrationLocalizations.delegate],
      context: context,
      child: const AutoRouter(),
    );
  }
}
