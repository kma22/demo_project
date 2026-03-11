import 'api_exception.dart';

class AppTimeoutException extends ApiException {
  AppTimeoutException(super.errorMessage, super.errorCode);
}
