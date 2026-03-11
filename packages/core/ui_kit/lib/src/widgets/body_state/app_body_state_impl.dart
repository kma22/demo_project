import 'package:flutter/material.dart';
import 'package:ui_kit/src/assets_gen/assets.gen.dart';
import 'package:ui_kit/ui_kit.dart';

class AppBodyStateImpl extends StatelessWidget {
  final AssetGenImage image;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const AppBodyStateImpl({
    required this.image,
    required this.message,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final actionLabel = this.actionLabel;
    final onAction = this.onAction;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.s32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 230,
              height: 230,
              decoration: BoxDecoration(color: colors.surfaceVariant, shape: BoxShape.circle),
              padding: EdgeInsets.all(layout.s24),
              child: Center(child: image.image()),
            ),
            SizedBox(height: layout.s32),
            Text(
              message,
              textAlign: TextAlign.center,
              style: textStyles.bodyL.copyWith(color: colors.textSecondary),
            ),
            if (actionLabel != null && onAction != null) ...[
              SizedBox(height: layout.s32),
              AppButton.secondary(title: actionLabel, onTap: onAction),
            ],
          ],
        ),
      ),
    );
  }
}
