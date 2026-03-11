import 'package:environment_data/src/enums/environment_name.dart';

class EnvironmentData {
  final String baseUrl;
  final String deeplinkBaseUrl;
  final EnvironmentName environmentName;

  EnvironmentData({
    required this.baseUrl,
    required this.deeplinkBaseUrl,
    required this.environmentName,
  }) : assert(baseUrl.isNotEmpty, 'Base URL must be defined'),
       assert(deeplinkBaseUrl.isNotEmpty, 'Deeplink Base URL must be defined');
}
