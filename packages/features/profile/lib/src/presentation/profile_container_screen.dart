import 'package:flutter/material.dart';
import 'package:routing/routing.dart';

import 'package:profile/src/config/l10n/gen/profile_localizations.dart';

@RoutePage()
class ProfileContainerScreen extends StatelessWidget {
  const ProfileContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      delegates: const [ProfileLocalizations.delegate],
      context: context,
      child: const AutoRouter(),
    );
  }
}
