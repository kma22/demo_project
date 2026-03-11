import 'package:auto_route/auto_route.dart';
import 'package:logger_manager/src/router/logger_manager_router.gr.dart';

@AutoRouterConfig()
class LoggerManagerRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [AutoRoute(page: TalkerLoggerRoute.page)];
}
