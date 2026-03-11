import 'package:flutter/material.dart';

import '../../../theme/extension/app_colors_extension.dart';
import '../enums/app_snack_bar_type.dart';

class AppSnackBarStyleFactory {
  final Color background;
  final Color foreground;
  final IconData icon;

  const AppSnackBarStyleFactory._({
    required this.background,
    required this.foreground,
    required this.icon,
  });

  factory AppSnackBarStyleFactory.resolve(AppSnackBarType type, AppColorsExtension colors) {
    return switch (type) {
      AppSnackBarType.success => AppSnackBarStyleFactory._(
        background: colors.success,
        foreground: colors.staticWhite,
        icon: Icons.check_circle_outline_rounded,
      ),
      AppSnackBarType.error => AppSnackBarStyleFactory._(
        background: colors.error,
        foreground: colors.staticWhite,
        icon: Icons.error_outline_rounded,
      ),
      AppSnackBarType.info => AppSnackBarStyleFactory._(
        background: colors.gray800,
        foreground: colors.staticWhite,
        icon: Icons.info_outline_rounded,
      ),
    };
  }
}
