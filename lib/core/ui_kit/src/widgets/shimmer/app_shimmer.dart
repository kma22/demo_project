import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Skeleton-shimmer обёртка UI Kit.
///
/// Оборачивает дочерний виджет shimmer-эффектом пока данные загружаются.
/// Работает в двух сценариях:
/// - Реальный layout с dummy-данными — Skeletonizer автоматически рисует скелетоны.
/// - Кастомный скелетон из [Bone] виджетов — когда layout зависит от данных.
class AppShimmer extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final bool? ignoreContainers;

  const AppShimmer({required this.child, this.enabled = true, this.ignoreContainers, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Skeletonizer(
      enabled: enabled,
      ignoreContainers: ignoreContainers,
      effect: ShimmerEffect(baseColor: colors.shimmerBase, highlightColor: colors.shimmerHighlight),
      child: child,
    );
  }
}
