import 'package:demo_project/features/login/src/data/dto/login_request_dto.dart';
import 'package:demo_project/features/login/src/data/dto/login_response_dto.dart';

/// Контракт API авторизации.
abstract interface class BaseLoginApiService {
  Future<LoginResponseDto> login(LoginRequestDto request);
}
