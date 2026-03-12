import 'package:flutter/material.dart';
import 'package:profile/src/config/l10n/localization_extension.dart';
import 'package:routing/routing.dart';
import 'package:ui_kit/ui_kit.dart';

/// Мок-экран профиля.
@RoutePage()
class ProfileScreen extends StatelessWidget {
  final VoidCallback onLogout;

  const ProfileScreen({required this.onLogout, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppAppBar(
        title: Text(l10n.title, style: textStyles.h2),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s16),
          child: AppButton.destructive(title: l10n.logout, onTap: onLogout, expanded: true),
        ),
      ),
    );
  }
}
