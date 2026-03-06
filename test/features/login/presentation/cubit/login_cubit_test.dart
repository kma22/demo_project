import 'package:bloc_test/bloc_test.dart';
import 'package:demo_project/core/api_client/api_client.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';
import 'package:demo_project/features/login/src/domain/repository/base_login_repository.dart';
import 'package:demo_project/features/login/src/presentation/cubit/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<BaseLoginRepository>(), MockSpec<AppLogger>()])
import 'login_cubit_test.mocks.dart';

void main() {
  late MockBaseLoginRepository mockRepo;
  late MockAppLogger mockLogger;

  setUp(() {
    mockRepo = MockBaseLoginRepository();
    mockLogger = MockAppLogger();
  });

  group('LoginCubit', () {
    const email = 'user@test.com';
    const password = 'password123';
    const accessToken = 'access_token';
    const refreshToken = 'refresh_token';

    test('initial state is LoginInitialState', () {
      final cubit = LoginCubit(mockRepo, mockLogger);
      expect(cubit.state, const LoginInitialState());
      cubit.close();
    });

    group('login', () {
      blocTest<LoginCubit, LoginState>(
        'emits [Loading, Success] on successful login',
        setUp: () {
          when(
            mockRepo.login(email: anyNamed('email'), password: anyNamed('password')),
          ).thenAnswer((_) async => (accessToken: accessToken, refreshToken: refreshToken));
        },
        build: () => LoginCubit(mockRepo, mockLogger),
        act: (cubit) => cubit.login(email: email, password: password),
        expect: () => [
          const LoginLoadingState(),
          const LoginSuccessState(accessToken: accessToken, refreshToken: refreshToken),
        ],
        verify: (_) {
          verify(mockRepo.login(email: email, password: password)).called(1);
          verify(mockLogger.info('Login success', runtimeType: LoginCubit)).called(1);
        },
      );

      blocTest<LoginCubit, LoginState>(
        'emits [Loading, Error] with message on ApiException',
        setUp: () {
          when(
            mockRepo.login(email: anyNamed('email'), password: anyNamed('password')),
          ).thenThrow(BadRequestException('Неверный пароль', 'INVALID_CREDENTIALS'));
        },
        build: () => LoginCubit(mockRepo, mockLogger),
        act: (cubit) => cubit.login(email: email, password: password),
        expect: () => [
          const LoginLoadingState(),
          const LoginErrorState(message: 'Неверный пароль'),
        ],
        verify: (_) {
          verify(
            mockLogger.error(
              runtimeType: LoginCubit,
              operation: 'login',
              msg: 'Неверный пароль',
            ),
          ).called(1);
        },
      );

      blocTest<LoginCubit, LoginState>(
        'emits [Loading, Error] without message on unexpected error',
        setUp: () {
          when(
            mockRepo.login(email: anyNamed('email'), password: anyNamed('password')),
          ).thenThrow(Exception('unexpected'));
        },
        build: () => LoginCubit(mockRepo, mockLogger),
        act: (cubit) => cubit.login(email: email, password: password),
        expect: () => [const LoginLoadingState(), const LoginErrorState()],
        verify: (_) {
          verify(
            mockLogger.error(
              runtimeType: LoginCubit,
              operation: 'login',
              exc: anyNamed('exc'),
              st: anyNamed('st'),
            ),
          ).called(1);
        },
      );
    });
  });
}
