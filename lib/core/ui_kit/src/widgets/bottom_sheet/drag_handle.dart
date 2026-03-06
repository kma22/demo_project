import 'package:demo_project/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Container(
      width: layout.r32,
      height: layout.r4,
      margin: EdgeInsets.only(top: layout.r16, bottom: layout.r12),
      decoration: BoxDecoration(
        color: colors.gray500,
        borderRadius: BorderRadius.circular(layout.r4),
      ),
    );
  }
}
