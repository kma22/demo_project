import 'package:auto_route/auto_route.dart';
import 'package:demo_project/core/routing/src/navigation/base_feature_navigation.dart';

import 'package:injectable/injectable.dart';

/// Реализация кросс-модульной навигации.
/// Находится в слое приложения, так как имеет доступ к конкретным роутам всех фич.
/// Подробнее: [NAVIGATION_ARCHITECTURE.md](demo_project/docs/NAVIGATION_ARCHITECTURE.md)
@LazySingleton(as: BaseFeatureNavigation)
class FeatureNavigation implements BaseFeatureNavigation {
  @override
  void openChangePasswordFeature(StackRouter router, String email) {
    // router.push(ChangePasswordContainerRoute(children: [EnterEmailRoute(email: email)]));
  }
}
