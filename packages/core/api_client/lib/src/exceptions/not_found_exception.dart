import 'api_exception.dart';

class NotFoundException extends ApiException {
  NotFoundException(super.errorMessage, super.errorCode);
}
