import 'package:demo_project/features/login/src/data/api/base_login_api_service.dart';
import 'package:demo_project/features/login/src/data/model/login_request_dto.dart';
import 'package:demo_project/features/login/src/data/model/login_response_dto.dart';
import 'package:demo_project/features/login/src/data/repository/login_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<BaseLoginApiService>()])
import 'login_repository_test.mocks.dart';

void main() {
  late MockBaseLoginApiService mockApiService;
  late LoginRepository repository;

  setUp(() {
    mockApiService = MockBaseLoginApiService();
    repository = LoginRepository(mockApiService);
  });

  group('AuthRepository', () {
    group('login', () {
      const email = 'user@test.com';
      const password = 'password123';

      test('creates LoginRequestDto and calls API service', () async {
        when(mockApiService.login(any)).thenAnswer(
          (_) async =>
              const LoginResponseDto(accessToken: 'access_token', refreshToken: 'refresh_token'),
        );

        await repository.login(email: email, password: password);

        final captured = verify(mockApiService.login(captureAny)).captured.single;
        expect(captured, isA<LoginRequestDto>());
        expect((captured as LoginRequestDto).email, email);
        expect(captured.password, password);
      });

      test('returns record with tokens on success', () async {
        when(mockApiService.login(any)).thenAnswer(
          (_) async =>
              const LoginResponseDto(accessToken: 'access_123', refreshToken: 'refresh_456'),
        );

        final result = await repository.login(email: email, password: password);

        expect(result.accessToken, 'access_123');
        expect(result.refreshToken, 'refresh_456');
      });

      test('rethrows API service exceptions', () async {
        when(mockApiService.login(any)).thenThrow(Exception('network error'));

        expect(() => repository.login(email: email, password: password), throwsException);
      });
    });
  });
}
