import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Контейнер неавторизованного поддерева.
///
/// Scope для auth flow: логин, регистрация, онбординг и т.д.
@RoutePage()
class UnauthenticatedContainerScreen extends StatelessWidget {
  const UnauthenticatedContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
