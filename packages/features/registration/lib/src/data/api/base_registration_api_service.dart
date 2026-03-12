import 'package:registration/src/data/dto/registration_request_dto.dart';
import 'package:registration/src/data/dto/registration_response_dto.dart';

/// Контракт API регистрации.
abstract interface class BaseRegistrationApiService {
  Future<RegistrationResponseDto> register(RegistrationRequestDto request);
}
