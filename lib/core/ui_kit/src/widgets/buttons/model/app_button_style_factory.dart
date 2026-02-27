import 'package:demo_project/core/ui_kit/src/theme/extension/app_colors_extension.dart';
import 'package:demo_project/core/ui_kit/src/widgets/buttons/enums/app_button_type.dart';
import 'package:demo_project/core/ui_kit/src/widgets/buttons/model/app_button_style.dart';
import 'package:flutter/material.dart';

class AppButtonStyleFactory {
  const AppButtonStyleFactory._();

  static AppButtonStyle resolve(AppButtonType type, bool enabled, AppColorsExtension c) {
    switch (type) {
      case AppButtonType.primary:
        return _primary(enabled, c);
      case AppButtonType.secondary:
        return _secondary(enabled, c);
      case AppButtonType.ghost:
        return _ghost(enabled, c);
      case AppButtonType.destructive:
        return _destructive(enabled, c);
    }
  }

  static AppButtonStyle _primary(bool enabled, AppColorsExtension c) {
    return AppButtonStyle(
      background: enabled ? c.primary : c.primary.withValues(alpha: 0.40),
      foreground: enabled ? c.onPrimary : c.onPrimary.withValues(alpha: 0.40),
      overlay: c.staticBlack.withValues(alpha: 0.06),
    );
  }

  static AppButtonStyle _secondary(bool enabled, AppColorsExtension c) {
    return AppButtonStyle(
      background: c.surface,
      foreground: enabled ? c.textPrimary : c.textPrimary.withValues(alpha: 0.40),
      border: enabled ? c.gray300 : c.gray300.withValues(alpha: 0.40),
      overlay: c.staticBlack.withValues(alpha: 0.04),
    );
  }

  static AppButtonStyle _ghost(bool enabled, AppColorsExtension c) {
    return AppButtonStyle(
      background: Colors.transparent,
      foreground: enabled ? c.textPrimary : c.textPrimary.withValues(alpha: 0.40),
      overlay: c.gray300.withValues(alpha: 0.20),
    );
  }

  static AppButtonStyle _destructive(bool enabled, AppColorsExtension c) {
    return AppButtonStyle(
      background: enabled ? c.error : c.error.withValues(alpha: 0.40),
      foreground: enabled ? c.staticWhite : c.staticWhite.withValues(alpha: 0.40),
      overlay: c.staticBlack.withValues(alpha: 0.08),
    );
  }
}
