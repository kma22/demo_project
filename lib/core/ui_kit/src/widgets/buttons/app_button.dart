import 'package:demo_project/core/ui_kit/src/widgets/buttons/app_button_impl.dart';
import 'package:demo_project/core/ui_kit/src/widgets/buttons/enums/app_button_size.dart';
import 'package:demo_project/core/ui_kit/src/widgets/buttons/enums/app_button_type.dart';
import 'package:flutter/material.dart';

class AppButton {
  const AppButton._();

  static Widget primary({
    required String title,
    VoidCallback? onTap,
    bool enabled = true,
    bool loading = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    AppButtonSize size = AppButtonSize.medium,
    bool expanded = false,
    Key? key,
  }) {
    return AppButtonImpl(
      key: key,
      title: title,
      onTap: onTap,
      enabled: enabled,
      loading: loading,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      size: size,
      expanded: expanded,
      type: AppButtonType.primary,
    );
  }

  static Widget secondary({
    required String title,
    VoidCallback? onTap,
    bool enabled = true,
    bool loading = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    AppButtonSize size = AppButtonSize.medium,
    bool expanded = false,
    Key? key,
  }) {
    return AppButtonImpl(
      key: key,
      title: title,
      onTap: onTap,
      enabled: enabled,
      loading: loading,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      size: size,
      expanded: expanded,
      type: AppButtonType.secondary,
    );
  }

  static Widget ghost({
    required String title,
    VoidCallback? onTap,
    bool enabled = true,
    bool loading = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    AppButtonSize size = AppButtonSize.medium,
    bool expanded = false,
    Key? key,
  }) {
    return AppButtonImpl(
      key: key,
      title: title,
      onTap: onTap,
      enabled: enabled,
      loading: loading,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      size: size,
      expanded: expanded,
      type: AppButtonType.ghost,
    );
  }

  static Widget destructive({
    required String title,
    VoidCallback? onTap,
    bool enabled = true,
    bool loading = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    AppButtonSize size = AppButtonSize.medium,
    bool expanded = false,
    Key? key,
  }) {
    return AppButtonImpl(
      key: key,
      title: title,
      onTap: onTap,
      enabled: enabled,
      loading: loading,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      size: size,
      expanded: expanded,
      type: AppButtonType.destructive,
    );
  }
}
