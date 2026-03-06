import 'package:demo_project/core/api_client/src/exceptions/api_exception.dart';

class NotFoundException extends ApiException {
  NotFoundException(super.errorMessage, super.errorCode);
}
