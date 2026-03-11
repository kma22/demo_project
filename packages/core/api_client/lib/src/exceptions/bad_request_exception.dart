import 'api_exception.dart';

class BadRequestException extends ApiException {
  BadRequestException(super.errorMessage, super.errorCode);
}
