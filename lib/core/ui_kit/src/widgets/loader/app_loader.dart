import 'package:demo_project/core/ui_kit/src/widgets/loader/app_loader_impl.dart';
import 'package:demo_project/core/ui_kit/src/widgets/loader/enums/app_loader_size.dart';
import 'package:flutter/material.dart';

/// Индикатор загрузки UI Kit.
///
/// ```dart
/// AppLoader.medium()
/// AppLoader.small(color: context.colors.onPrimary)
/// AppLoader.large(progress: 0.7)
/// ```
class AppLoader {
  const AppLoader._();

  static Widget small({Color? color, double? progress, Key? key}) {
    return AppLoaderImpl(key: key, size: AppLoaderSize.small, color: color, progress: progress);
  }

  static Widget medium({Color? color, double? progress, Key? key}) {
    return AppLoaderImpl(key: key, size: AppLoaderSize.medium, color: color, progress: progress);
  }

  static Widget large({Color? color, double? progress, Key? key}) {
    return AppLoaderImpl(key: key, size: AppLoaderSize.large, color: color, progress: progress);
  }
}
