import 'package:demo_project/core/api_client/api_client.dart';
import 'package:demo_project/features/auth/src/data/api/base_auth_api_service.dart';
import 'package:demo_project/features/auth/src/data/model/login_request_dto.dart';
import 'package:demo_project/features/auth/src/data/model/login_response_dto.dart';
import 'package:injectable/injectable.dart';

/// Мок-реализация API авторизации.
///
/// Имитирует сетевой запрос с задержкой 1 секунда.
/// Для демонстрации обработки ошибок: email `error@test.com` вызывает ошибку.
/// Любые другие валидные данные -- успешный логин.
@Injectable(as: BaseAuthApiService)
class MockAuthApiService implements BaseAuthApiService {
  @override
  Future<LoginResponseDto> login(LoginRequestDto request) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    if (request.email.toLowerCase() == 'error@test.com') {
      throw BadRequestException('Неверный логин или пароль', 'INVALID_CREDENTIALS');
    }

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return LoginResponseDto(
      accessToken: 'mock_access_$timestamp',
      refreshToken: 'mock_refresh_$timestamp',
    );
  }
}
