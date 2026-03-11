import 'package:routing/routing.dart';

import 'package:profile/src/config/router/profile_router.gr.dart';

@AutoRouterConfig()
class ProfileRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: ProfileContainerRoute.page,
      children: [AutoRoute(page: ProfileRoute.page, initial: true)],
    ),
  ];
}
