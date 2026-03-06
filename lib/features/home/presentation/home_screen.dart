import 'package:auto_route/auto_route.dart';
import 'package:demo_project/core/l10n/l10n.dart';
import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

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
        title: Text(l10n.homeTitle, style: textStyles.h2),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s16),
          child: AppButton.primary(title: l10n.profileLogout, onTap: onLogout, expanded: true),
        ),
      ),
    );
  }
}
