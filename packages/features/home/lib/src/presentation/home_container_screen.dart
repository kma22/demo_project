import 'package:flutter/material.dart';
import 'package:routing/routing.dart';

import 'package:home/src/config/l10n/gen/home_localizations.dart';

@RoutePage()
class HomeContainerScreen extends StatelessWidget {
  const HomeContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      delegates: const [HomeLocalizations.delegate],
      context: context,
      child: const AutoRouter(),
    );
  }
}
