import 'package:routing/routing.dart';

import 'package:home/src/config/router/home_router.gr.dart';

@AutoRouterConfig()
class HomeRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeContainerRoute.page,
      children: [AutoRoute(page: HomeRoute.page, initial: true)],
    ),
  ];
}
