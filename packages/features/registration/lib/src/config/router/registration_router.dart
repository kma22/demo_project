import 'package:routing/routing.dart';

import 'package:registration/src/config/router/registration_router.gr.dart';

@AutoRouterConfig()
class RegistrationRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: RegistrationContainerRoute.page,
      children: [AutoRoute(page: RegistrationRoute.page, initial: true)],
    ),
  ];
}
