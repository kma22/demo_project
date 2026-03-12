import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// AppBar UI Kit с предустановленными цветами из темы.
///
/// Использует [AutoLeadingButton] для корректной работы кнопки «назад»
/// внутри вложенных роутеров (ContainerScreen-паттерн).
///
/// ```dart
/// Scaffold(
///   appBar: AppAppBar(title: Text('Заголовок')),
/// )
/// ```
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool? centerTitle;

  const AppAppBar({
    this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.centerTitle,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AppBar(
      title: title,
      actions: actions,
      leading: leading ?? (automaticallyImplyLeading ? const AutoLeadingButton() : null),
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      backgroundColor: colors.background,
      foregroundColor: colors.textPrimary,
      elevation: 0,
    );
  }
}
