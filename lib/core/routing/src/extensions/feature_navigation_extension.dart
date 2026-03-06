import 'package:auto_route/auto_route.dart';
import 'package:demo_project/core/routing/src/navigation/base_feature_navigation.dart';
import 'package:get_it/get_it.dart';

/// Набор методов для вызова кросс-модульной навигации через context.router.
/// Скрывает детали Service Locator (GetIt) от UI-слоя.
/// Подробнее: [NAVIGATION_ARCHITECTURE.md](demo_project/docs/NAVIGATION_ARCHITECTURE.md)
extension FeatureNavigationExtension on StackRouter {
  static BaseFeatureNavigation get _featureNavigation => GetIt.I<BaseFeatureNavigation>();

  void openRegistrationFeature({
    required void Function({required String accessToken, required String refreshToken}) onSuccess,
  }) => _featureNavigation.openRegistrationFeature(this, onSuccess);
}
