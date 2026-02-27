import 'package:demo_project/core/ui_kit/src/widgets/snack_bar/enums/app_snack_bar_type.dart';
import 'package:demo_project/core/ui_kit/src/widgets/snack_bar/model/app_snack_bar_style_factory.dart';
import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

/// Снэкбар UI Kit. Показывает feedback-сообщение через [ScaffoldMessenger].
///
/// ```dart
/// AppSnackBar.success(context, message: 'Сохранено');
/// AppSnackBar.error(context, message: 'Ошибка сети');
/// AppSnackBar.info(context, message: 'Скопировано');
/// ```
class AppSnackBar {
  const AppSnackBar._();

  static void success(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(context, message: message, type: AppSnackBarType.success, duration: duration);
  }

  static void error(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    _show(context, message: message, type: AppSnackBarType.error, duration: duration);
  }

  static void info(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(context, message: message, type: AppSnackBarType.info, duration: duration);
  }

  static void _show(
    BuildContext context, {
    required String message,
    required AppSnackBarType type,
    required Duration duration,
  }) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final style = AppSnackBarStyleFactory.resolve(type, colors);

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor: style.background,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(layout.r12)),
          margin: EdgeInsets.symmetric(horizontal: layout.s16, vertical: layout.s8),
          padding: EdgeInsets.symmetric(horizontal: layout.s16, vertical: layout.s12),
          content: Row(
            children: [
              Icon(style.icon, color: style.foreground, size: layout.s20),
              SizedBox(width: layout.s12),
              Expanded(
                child: Text(message, style: textStyles.bodyM.copyWith(color: style.foreground)),
              ),
            ],
          ),
        ),
      );
  }
}
