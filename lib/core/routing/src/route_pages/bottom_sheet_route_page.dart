import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class BottomSheetRoutePage extends StatelessWidget {
  const BottomSheetRoutePage({
    required this.child,
    required this.topPadding,
    this.padding,
    this.isShowCloseButton = false,
    this.enableDrag = true,
    this.addKeyboardHeightBottomPadding = false,
    this.addBottomPadding = false,
    super.key,
  });

  final Widget child;
  final double topPadding;
  final bool addKeyboardHeightBottomPadding;
  final bool isShowCloseButton;
  final bool enableDrag;
  final EdgeInsets? padding;
  final bool addBottomPadding;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final effectivePadding = padding ?? EdgeInsets.symmetric(horizontal: layout.s24);

    return Container(
      padding: EdgeInsets.fromLTRB(
        effectivePadding.left,
        effectivePadding.top,
        effectivePadding.right,
        addKeyboardHeightBottomPadding
            ? effectivePadding.bottom + keyboardHeight
            : effectivePadding.bottom,
      ),
      margin: EdgeInsets.only(top: topPadding),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(layout.r32),
          topRight: Radius.circular(layout.r32),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              enableDrag ? const DragHandle() : SizedBox(height: layout.s24),
              Flexible(child: child),
              if (addBottomPadding) SizedBox(height: bottomPadding),
            ],
          ),
          if (isShowCloseButton)
            Positioned(
              top: layout.s16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, size: layout.s24, color: colors.onSurface),
              ),
            ),
        ],
      ),
    );
  }
}
