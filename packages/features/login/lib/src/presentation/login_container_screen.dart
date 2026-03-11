import 'package:flutter/material.dart';
import 'package:routing/routing.dart';

import 'package:login/src/config/l10n/gen/login_localizations.dart';

@RoutePage()
class LoginContainerScreen extends StatelessWidget {
  const LoginContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      delegates: const [LoginLocalizations.delegate],
      context: context,
      child: const AutoRouter(),
    );
  }
}
