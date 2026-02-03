import 'package:auto_route/auto_route.dart';
import 'package:demo_project/app/router/app_router.dart';

class LoggerManagerRouter {
  List<AutoRoute> get routes => [AutoRoute(page: TalkerLoggerRoute.page)];
}
