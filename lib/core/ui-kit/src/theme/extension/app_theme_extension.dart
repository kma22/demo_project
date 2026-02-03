import 'package:demo_project/core/ui-kit/src/theme/extension/app_colors_extension.dart';
import 'package:demo_project/core/ui-kit/src/theme/extension/app_layout_extension.dart';
import 'package:demo_project/core/ui-kit/src/theme/extension/app_text_style_extension.dart';
import 'package:flutter/material.dart';

extension AppThemeExtension on BuildContext {
  AppColorsExtension get colors => AppColorsExtension.of(this)!;

  AppTextStyleExtension get textStyles => AppTextStyleExtension.of(this)!;

  AppLayoutExtension get layout => AppLayoutExtension.of(this)!;
}
