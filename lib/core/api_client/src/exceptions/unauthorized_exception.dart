import 'package:demo_project/core/api_client/src/exceptions/api_exception.dart';

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.errorMessage, super.errorCode);
}
