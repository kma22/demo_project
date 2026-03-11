import 'package:routing/routing.dart';

import 'package:login/src/config/router/login_router.gr.dart';

@AutoRouterConfig()
class LoginRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: LoginContainerRoute.page,
      children: [AutoRoute(page: LoginRoute.page, initial: true)],
    ),
  ];
}
