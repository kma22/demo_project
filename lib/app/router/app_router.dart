import 'package:auto_route/auto_route.dart';
import 'package:demo_project/app/navigation/bottom_navigation_screen.dart';
import 'package:demo_project/app/session/presentation/screens/authenticated_container_screen.dart';
import 'package:demo_project/app/session/presentation/screens/session_container_screen.dart';
import 'package:demo_project/app/session/presentation/screens/splash_screen.dart';
import 'package:demo_project/app/session/presentation/screens/unauthenticated_container_screen.dart';
import 'package:demo_project/features/login/login.dart';
import 'package:demo_project/features/registration/registration.dart';
import 'package:flutter/foundation.dart';
import 'package:home/home.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:profile/profile.dart';

part 'app_router.gr.dart';

/// Главный навигационный оркестратор приложения.
/// Объединяет маршруты всех независимых функциональных модулей.
/// Подробнее: [NAVIGATION_ARCHITECTURE.md](demo_project/docs/NAVIGATION_ARCHITECTURE.md)
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  final _loggerManagerRouter = LoggerManagerRouter();
  final _homeRouter = HomeRouter();
  final _profileRouter = ProfileRouter();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SessionContainerRoute.page,
      initial: true,
      children: [
        AutoRoute(page: SplashRoute.page),
        AutoRoute(
          page: UnauthenticatedContainerRoute.page,
          children: [
            AutoRoute(page: LoginRoute.page, initial: true),
            AutoRoute(page: RegistrationRoute.page),
          ],
        ),
        AutoRoute(
          page: AuthenticatedContainerRoute.page,
          children: [
            AutoRoute(
              page: BottomNavigationRoute.page,
              initial: true,
              children: [..._homeRouter.routes, ..._profileRouter.routes],
            ),
          ],
        ),
      ],
    ),
    ..._loggerManagerRouter.routes,
  ];
}
