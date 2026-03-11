import 'api_exception.dart';

class ServerErrorException extends ApiException {
  ServerErrorException(super.errorMessage, super.errorCode);
}
