import 'package:api_client/api_client.dart';
import 'package:demo_project/features/registration/src/data/api/base_registration_api_service.dart';
import 'package:demo_project/features/registration/src/data/dto/registration_request_dto.dart';
import 'package:demo_project/features/registration/src/data/dto/registration_response_dto.dart';
import 'package:injectable/injectable.dart';

/// Мок-реализация API регистрации.
///
/// Имитирует сетевой запрос с задержкой 1 секунда.
/// Email `taken@test.com` вызывает ошибку для демонстрации.
@Injectable(as: BaseRegistrationApiService)
class MockRegistrationApiService implements BaseRegistrationApiService {
  @override
  Future<RegistrationResponseDto> register(RegistrationRequestDto request) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    if (request.email.toLowerCase() == 'taken@test.com') {
      throw BadRequestException('Email уже зарегистрирован', 'EMAIL_ALREADY_EXISTS');
    }

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return RegistrationResponseDto(
      accessToken: 'mock_access_$timestamp',
      refreshToken: 'mock_refresh_$timestamp',
    );
  }
}
