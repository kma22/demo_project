import 'package:auto_route/auto_route.dart';
import 'package:demo_project/app/session/presentation/screens/authenticated_container_screen.dart';
import 'package:demo_project/app/session/presentation/screens/session_container_screen.dart';
import 'package:demo_project/app/session/presentation/screens/splash_screen.dart';
import 'package:demo_project/app/session/presentation/screens/unauthenticated_container_screen.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';
import 'package:demo_project/features/auth/presentation/login_screen.dart';
import 'package:demo_project/features/home/presentation/home_screen.dart';
import 'package:flutter/foundation.dart';

part 'app_router.gr.dart';

/// Главный навигационный оркестратор приложения.
/// Объединяет маршруты всех независимых функциональных модулей.
/// Подробнее: [NAVIGATION_ARCHITECTURE.md](demo_project/docs/NAVIGATION_ARCHITECTURE.md)
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SessionContainerRoute.page,
      initial: true,
      children: [
        AutoRoute(page: SplashRoute.page),
        AutoRoute(
          page: UnauthenticatedContainerRoute.page,
          children: [AutoRoute(page: LoginRoute.page, initial: true)],
        ),
        AutoRoute(
          page: AuthenticatedContainerRoute.page,
          children: [AutoRoute(page: HomeRoute.page, initial: true)],
        ),
      ],
    ),
    AutoRoute(page: TalkerLoggerRoute.page),
  ];
}
