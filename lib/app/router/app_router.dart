import 'package:auto_route/auto_route.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';

part 'app_router.gr.dart';

/// Главный навигационный оркестратор приложения.
/// Объединяет маршруты всех независимых функциональных модулей.
/// Подробнее: [NAVIGATION_ARCHITECTURE.md](demo_project/docs/NAVIGATION_ARCHITECTURE.md)
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  final _loggerManagerRouter = LoggerManagerRouter();

  @override
  List<AutoRoute> get routes => [..._loggerManagerRouter.routes];
}
