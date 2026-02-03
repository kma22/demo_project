import 'package:auto_route/auto_route.dart';
import 'package:demo_project/app/router/app_router.dart';
import 'package:flutter/material.dart';

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
