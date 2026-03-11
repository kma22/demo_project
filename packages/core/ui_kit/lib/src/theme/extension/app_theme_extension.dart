import 'package:flutter/material.dart';

import 'app_colors_extension.dart';
import 'app_layout_extension.dart';
import 'app_text_style_extension.dart';

extension AppThemeExtension on BuildContext {
  AppColorsExtension get colors => AppColorsExtension.of(this)!;

  AppTextStyleExtension get textStyles => AppTextStyleExtension.of(this)!;

  AppLayoutExtension get layout => AppLayoutExtension.of(this)!;
}
