import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:logger_manager/src/router/logger_manager_router.gr.dart';

class LogAccessWrapper extends StatelessWidget {
  const LogAccessWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(const TalkerLoggerRoute()),
      child: AbsorbPointer(child: child),
    );
  }
}
