import 'package:auto_route/auto_route.dart';

/// Контракт для кросс-модульной навигации.
/// Позволяет фичам инициировать переходы вовне без прямой зависимости от других модулей.
/// Подробнее: [NAVIGATION_ARCHITECTURE.md](demo_project/docs/NAVIGATION_ARCHITECTURE.md)
abstract interface class BaseFeatureNavigation {
  void openRegistrationFeature(StackRouter router);
}
