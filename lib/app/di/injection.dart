import 'package:demo_project/app/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String environmentName) {
  return getIt.init(environment: environmentName.isEmpty ? 'dev' : environmentName);
}
