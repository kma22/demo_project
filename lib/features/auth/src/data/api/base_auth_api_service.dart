import 'package:demo_project/features/auth/src/data/model/login_request_dto.dart';
import 'package:demo_project/features/auth/src/data/model/login_response_dto.dart';

/// Контракт API авторизации.
abstract interface class BaseAuthApiService {
  Future<LoginResponseDto> login(LoginRequestDto request);
}
