import 'package:demo_project/app/di/injection.config.dart';
import 'package:environment_data/environment_data.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger_manager/logger_manager.dart';

final getIt = GetIt.instance;

@InjectableInit(
  includeMicroPackages: false,
  externalPackageModulesBefore: [
    ExternalModule(EnvironmentDataPackageModule),
    ExternalModule(LoggerManagerPackageModule),
  ],
)
Future<void> configureDependencies(String environmentName) {
  return getIt.init(environment: environmentName.isEmpty ? 'dev' : environmentName);
}
