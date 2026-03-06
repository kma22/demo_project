import 'package:demo_project/core/ui_kit/src/widgets/loader/enums/app_loader_size.dart';
import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class AppLoaderImpl extends StatelessWidget {
  final AppLoaderSize size;
  final Color? color;
  final double? progress;

  const AppLoaderImpl({required this.size, this.color, this.progress, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    final dimension = _dimension(layout);

    return SizedBox(
      width: dimension,
      height: dimension,
      child: CircularProgressIndicator(
        strokeWidth: _strokeWidth(layout),
        color: color ?? colors.primary,
        value: progress,
      ),
    );
  }

  double _dimension(AppLayoutExtension layout) => switch (size) {
    AppLoaderSize.small => layout.s16,
    AppLoaderSize.medium => layout.s24,
    AppLoaderSize.large => layout.s40,
  };

  double _strokeWidth(AppLayoutExtension layout) => switch (size) {
    AppLoaderSize.small => layout.s2,
    AppLoaderSize.medium => layout.s2,
    AppLoaderSize.large => layout.s4,
  };
}
