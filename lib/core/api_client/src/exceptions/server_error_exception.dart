import 'package:demo_project/core/api_client/src/exceptions/api_exception.dart';

class ServerErrorException extends ApiException {
  ServerErrorException(super.errorMessage, super.errorCode);
}
