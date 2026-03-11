import 'package:demo_project/app/router/app_router.dart';
import 'package:injectable/injectable.dart';
import 'package:routing/routing.dart';

/// Реализация кросс-модульной навигации.
/// Находится в слое приложения, так как имеет доступ к конкретным роутам всех фич.
/// Подробнее: [NAVIGATION_ARCHITECTURE.md](demo_project/docs/NAVIGATION_ARCHITECTURE.md)
@LazySingleton(as: BaseFeatureNavigation)
class FeatureNavigation implements BaseFeatureNavigation {
  @override
  void openRegistrationFeature(
    StackRouter router,
    void Function({required String accessToken, required String refreshToken}) onSuccess,
  ) => router.push(RegistrationRoute(onSuccess: onSuccess));
}
