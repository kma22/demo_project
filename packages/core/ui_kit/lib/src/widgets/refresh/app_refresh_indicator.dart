import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

/// Pull-to-refresh обёртка UI Kit.
/// Использует [RefreshIndicator.adaptive] — Material на Android, Cupertino на iOS.
class AppRefreshIndicator extends StatelessWidget {
  final Widget child;
  final RefreshCallback onRefresh;

  const AppRefreshIndicator({required this.child, required this.onRefresh, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return RefreshIndicator.adaptive(onRefresh: onRefresh, color: colors.primary, child: child);
  }
}
