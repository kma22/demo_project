import 'package:api_client/api_client.dart';
import 'package:demo_project/app/di/injection.config.dart';
import 'package:environment_data/environment_data.dart';
import 'package:get_it/get_it.dart';
import 'package:home/home.dart';
import 'package:injectable/injectable.dart';
import 'package:local_storage/local_storage.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:login/login.dart';
import 'package:profile/profile.dart';
import 'package:ui_kit/ui_kit.dart';

final getIt = GetIt.instance;

@InjectableInit(
  includeMicroPackages: false,
  externalPackageModulesBefore: [
    ExternalModule(EnvironmentDataPackageModule),
    ExternalModule(LoggerManagerPackageModule),
    ExternalModule(LocalStoragePackageModule),
    ExternalModule(UiKitPackageModule),
    ExternalModule(ApiClientPackageModule),
  ],
  externalPackageModulesAfter: [
    ExternalModule(LoginPackageModule),
    ExternalModule(HomePackageModule),
    ExternalModule(ProfilePackageModule),
  ],
)
Future<void> configureDependencies(String environmentName) {
  return getIt.init(environment: environmentName.isEmpty ? 'dev' : environmentName);
}
