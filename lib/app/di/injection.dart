import 'package:demo_project/app/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'init', preferRelativeImports: true, asExtension: true)
Future<void> configureDependencies(String environmentName) {
  return getIt.init(environment: environmentName.isEmpty ? 'dev' : environmentName);
}
