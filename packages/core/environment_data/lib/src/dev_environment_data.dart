import 'package:environment_data/src/enums/environment_name.dart';
import 'package:environment_data/src/environment_data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EnvironmentData, env: ['dev'])
class DevEnvironmentData extends EnvironmentData {
  static const _baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://dev.demo-app.dev',
  );
  static const _deeplinkBaseUrl = String.fromEnvironment(
    'DEEPLINK_BASE_URL',
    defaultValue: 'https://demo-app.dev/',
  );

  DevEnvironmentData()
    : super(
        baseUrl: _baseUrl,
        deeplinkBaseUrl: _deeplinkBaseUrl,
        environmentName: EnvironmentName.dev,
      );
}
