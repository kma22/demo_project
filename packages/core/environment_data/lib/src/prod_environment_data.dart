import 'package:environment_data/src/enums/environment_name.dart';
import 'package:environment_data/src/environment_data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EnvironmentData, env: ['prod'])
class ProdEnvironmentData extends EnvironmentData {
  static const _baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://prod.demo-app.dev',
  );
  static const _deeplinkBaseUrl = String.fromEnvironment(
    'DEEPLINK_BASE_URL',
    defaultValue: 'https://demo-app.dev/',
  );

  ProdEnvironmentData()
    : super(
        baseUrl: _baseUrl,
        deeplinkBaseUrl: _deeplinkBaseUrl,
        environmentName: EnvironmentName.prod,
      );
}
