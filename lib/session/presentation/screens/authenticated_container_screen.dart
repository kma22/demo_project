import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// Контейнер авторизованного поддерева.
///
/// Scope для main flow: главная, профиль, настройки и т.д.
@RoutePage()
class AuthenticatedContainerScreen extends StatelessWidget {
  const AuthenticatedContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
