import 'package:login/src/data/dto/login_request_dto.dart';
import 'package:login/src/data/dto/login_response_dto.dart';

/// Контракт API авторизации.
abstract interface class BaseLoginApiService {
  Future<LoginResponseDto> login(LoginRequestDto request);
}
