import 'api_exception.dart';

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.errorMessage, super.errorCode);
}
