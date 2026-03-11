import 'api_exception.dart';

class UnknownApiException extends ApiException {
  final int? statusCode;

  UnknownApiException(super.errorMessage, super.errorCode, {this.statusCode});
}
