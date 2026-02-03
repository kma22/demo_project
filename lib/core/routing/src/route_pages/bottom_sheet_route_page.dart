import 'package:flutter/material.dart';

class BottomSheetRoutePage extends StatelessWidget {
  const BottomSheetRoutePage({
    required this.child,
    required this.topPadding,
    this.padding = const EdgeInsets.fromLTRB(24, 0, 24, 0),
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
  final EdgeInsets padding;
  final bool addBottomPadding;

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.fromLTRB(
        padding.left,
        padding.top,
        padding.right,
        addKeyboardHeightBottomPadding ? padding.bottom + keyboardHeight : padding.bottom,
      ),
      margin: EdgeInsets.only(top: topPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: child),
              if (addBottomPadding) SizedBox(height: bottomPadding),
            ],
          ),
          if (isShowCloseButton)
            Positioned(
              top: 16,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, size: 24, color: Colors.black),
              ),
            ),
        ],
      ),
    );
  }
}
