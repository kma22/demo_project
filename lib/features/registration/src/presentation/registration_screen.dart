import 'package:demo_project/core/l10n/l10n.dart';
import 'package:demo_project/core/routing/routing.dart';
import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

/// Экран регистрации (заглушка).
@RoutePage()
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(l10n.registrationTitle),
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
      ),
      body: Center(
        child: Text(
          l10n.registrationTitle,
          style: textStyles.h1,
        ),
      ),
    );
  }
}
