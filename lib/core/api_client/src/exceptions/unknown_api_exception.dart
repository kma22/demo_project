import 'package:demo_project/core/api_client/src/exceptions/api_exception.dart';

class UnknownApiException extends ApiException {
  final int? statusCode;

  UnknownApiException(super.errorMessage, super.errorCode, {this.statusCode});
}
