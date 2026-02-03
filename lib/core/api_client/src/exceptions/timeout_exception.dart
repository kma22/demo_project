import 'package:demo_project/core/api_client/src/exceptions/api_exception.dart';

class AppTimeoutException extends ApiException {
  AppTimeoutException(super.errorMessage, super.errorCode);
}
