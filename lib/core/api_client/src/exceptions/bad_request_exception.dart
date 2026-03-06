import 'package:demo_project/core/api_client/src/exceptions/api_exception.dart';

class BadRequestException extends ApiException {
  BadRequestException(super.errorMessage, super.errorCode);
}
