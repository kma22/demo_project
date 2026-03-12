import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:registration/src/data/api/base_registration_api_service.dart';
import 'package:registration/src/data/dto/registration_request_dto.dart';
import 'package:registration/src/data/dto/registration_response_dto.dart';
import 'package:registration/src/data/repository/registration_repository.dart';

@GenerateNiceMocks([MockSpec<BaseRegistrationApiService>()])
import 'registration_repository_test.mocks.dart';

void main() {
  late MockBaseRegistrationApiService mockApiService;
  late RegistrationRepository repository;

  setUp(() {
    mockApiService = MockBaseRegistrationApiService();
    repository = RegistrationRepository(mockApiService);
  });

  group('RegistrationRepository', () {
    const email = 'user@test.com';
    const password = 'Password1';

    group('register', () {
      test('creates RegistrationRequestDto and calls API service', () async {
        when(mockApiService.register(any)).thenAnswer(
          (_) async => const RegistrationResponseDto(
            accessToken: 'access_token',
            refreshToken: 'refresh_token',
          ),
        );

        await repository.register(email: email, password: password);

        final captured = verify(mockApiService.register(captureAny)).captured.single;
        expect(captured, isA<RegistrationRequestDto>());
        expect((captured as RegistrationRequestDto).email, email);
        expect(captured.password, password);
      });

      test('returns record with tokens on success', () async {
        when(mockApiService.register(any)).thenAnswer(
          (_) async =>
              const RegistrationResponseDto(accessToken: 'access_123', refreshToken: 'refresh_456'),
        );

        final result = await repository.register(email: email, password: password);

        expect(result.accessToken, 'access_123');
        expect(result.refreshToken, 'refresh_456');
      });

      test('rethrows API service exceptions', () async {
        when(mockApiService.register(any)).thenThrow(Exception('network error'));

        expect(() => repository.register(email: email, password: password), throwsException);
      });
    });
  });
}
