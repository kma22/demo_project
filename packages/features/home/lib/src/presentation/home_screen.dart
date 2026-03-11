import 'package:flutter/material.dart';
import 'package:home/src/config/l10n/localization_extension.dart';
import 'package:routing/routing.dart';
import 'package:ui_kit/ui_kit.dart';

/// Временная заглушка главного экрана.
@RoutePage()
class HomeScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const HomeScreen({required this.onLogout, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        title: Text(l10n.title, style: textStyles.h2),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s16),
          child: AppButton.primary(title: l10n.logout, onTap: onLogout, expanded: true),
        ),
      ),
    );
  }
}
