import 'package:bloc_test/bloc_test.dart';
import 'package:demo_project/core/api_client/api_client.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';
import 'package:demo_project/features/registration/src/domain/entity/registration_field.dart';
import 'package:demo_project/features/registration/src/domain/entity/registration_validation_error.dart';
import 'package:demo_project/features/registration/src/domain/use_case/register_use_case.dart';
import 'package:demo_project/features/registration/src/domain/use_case/validate_registration_use_case.dart';
import 'package:demo_project/features/registration/src/presentation/cubit/registration_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<ValidateRegistrationUseCase>(),
  MockSpec<RegisterUseCase>(),
  MockSpec<AppLogger>(),
])
import 'registration_cubit_test.mocks.dart';

void main() {
  late MockValidateRegistrationUseCase mockValidate;
  late MockRegisterUseCase mockRegister;
  late MockAppLogger mockLogger;

  setUp(() {
    mockValidate = MockValidateRegistrationUseCase();
    mockRegister = MockRegisterUseCase();
    mockLogger = MockAppLogger();
  });

  group('RegistrationCubit', () {
    const email = 'user@test.com';
    const password = 'Password1';
    const confirmPassword = 'Password1';
    const accessToken = 'access_token';
    const refreshToken = 'refresh_token';

    test('initial state is RegistrationFormState', () {
      final cubit = RegistrationCubit(mockValidate, mockRegister, mockLogger);
      expect(cubit.state, const RegistrationFormState());
      cubit.close();
    });

    group('validateFields', () {
      blocTest<RegistrationCubit, RegistrationState>(
        'does not emit before first submit',
        build: () => RegistrationCubit(mockValidate, mockRegister, mockLogger),
        act: (cubit) => cubit.validateFields(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
        expect: () => <RegistrationState>[],
        verify: (_) {
          verifyNever(
            mockValidate(
              email: anyNamed('email'),
              password: anyNamed('password'),
              confirmPassword: anyNamed('confirmPassword'),
            ),
          );
        },
      );

      blocTest<RegistrationCubit, RegistrationState>(
        'emits validation errors after first submit',
        setUp: () {
          var callCount = 0;
          when(
            mockValidate(
              email: anyNamed('email'),
              password: anyNamed('password'),
              confirmPassword: anyNamed('confirmPassword'),
            ),
          ).thenAnswer((_) {
            callCount++;
            // Первый вызов (register) — ошибка email
            if (callCount == 1) {
              return {RegistrationField.email: RegistrationValidationError.empty};
            }
            // Второй вызов (validateFields) — ошибка email + password
            return {
              RegistrationField.email: RegistrationValidationError.empty,
              RegistrationField.password: RegistrationValidationError.passwordTooShort,
            };
          });
        },
        build: () => RegistrationCubit(mockValidate, mockRegister, mockLogger),
        act: (cubit) async {
          await cubit.register(email: '', password: 'short', confirmPassword: 'short');
          cubit.validateFields(email: '', password: 'short', confirmPassword: 'short');
        },
        expect: () => [
          const RegistrationFormState(
            fieldErrors: {RegistrationField.email: RegistrationValidationError.empty},
          ),
          const RegistrationFormState(
            fieldErrors: {
              RegistrationField.email: RegistrationValidationError.empty,
              RegistrationField.password: RegistrationValidationError.passwordTooShort,
            },
          ),
        ],
      );
    });

    group('register', () {
      blocTest<RegistrationCubit, RegistrationState>(
        'emits [Loading, Success] on valid input and successful registration',
        setUp: () {
          when(
            mockValidate(
              email: anyNamed('email'),
              password: anyNamed('password'),
              confirmPassword: anyNamed('confirmPassword'),
            ),
          ).thenReturn({});

          when(
            mockRegister(email: anyNamed('email'), password: anyNamed('password')),
          ).thenAnswer((_) async => (accessToken: accessToken, refreshToken: refreshToken));
        },
        build: () => RegistrationCubit(mockValidate, mockRegister, mockLogger),
        act: (cubit) => cubit.register(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
        expect: () => [
          const RegistrationLoadingState(),
          const RegistrationSuccessState(accessToken: accessToken, refreshToken: refreshToken),
        ],
        verify: (_) {
          verify(mockRegister(email: email, password: password)).called(1);
        },
      );

      blocTest<RegistrationCubit, RegistrationState>(
        'emits [FormState with errors] when validation fails',
        setUp: () {
          when(
            mockValidate(
              email: anyNamed('email'),
              password: anyNamed('password'),
              confirmPassword: anyNamed('confirmPassword'),
            ),
          ).thenReturn({
            RegistrationField.email: RegistrationValidationError.invalidEmail,
            RegistrationField.password: RegistrationValidationError.passwordTooShort,
          });
        },
        build: () => RegistrationCubit(mockValidate, mockRegister, mockLogger),
        act: (cubit) => cubit.register(
          email: 'bad',
          password: 'short',
          confirmPassword: 'short',
        ),
        expect: () => [
          const RegistrationFormState(fieldErrors: {
            RegistrationField.email: RegistrationValidationError.invalidEmail,
            RegistrationField.password: RegistrationValidationError.passwordTooShort,
          }),
        ],
        verify: (_) {
          verifyNever(mockRegister(email: anyNamed('email'), password: anyNamed('password')));
        },
      );

      blocTest<RegistrationCubit, RegistrationState>(
        'emits [Loading, Error] with message on ApiException',
        setUp: () {
          when(
            mockValidate(
              email: anyNamed('email'),
              password: anyNamed('password'),
              confirmPassword: anyNamed('confirmPassword'),
            ),
          ).thenReturn({});

          when(
            mockRegister(email: anyNamed('email'), password: anyNamed('password')),
          ).thenThrow(BadRequestException('Email уже зарегистрирован', 'EMAIL_ALREADY_EXISTS'));
        },
        build: () => RegistrationCubit(mockValidate, mockRegister, mockLogger),
        act: (cubit) => cubit.register(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
        expect: () => [
          const RegistrationLoadingState(),
          const RegistrationErrorState(message: 'Email уже зарегистрирован'),
        ],
        verify: (_) {
          verify(
            mockLogger.error(
              runtimeType: RegistrationCubit,
              operation: 'register',
              msg: 'Email уже зарегистрирован',
            ),
          ).called(1);
        },
      );

      blocTest<RegistrationCubit, RegistrationState>(
        'emits [Loading, Error] without message on unexpected error',
        setUp: () {
          when(
            mockValidate(
              email: anyNamed('email'),
              password: anyNamed('password'),
              confirmPassword: anyNamed('confirmPassword'),
            ),
          ).thenReturn({});

          when(
            mockRegister(email: anyNamed('email'), password: anyNamed('password')),
          ).thenThrow(Exception('unexpected'));
        },
        build: () => RegistrationCubit(mockValidate, mockRegister, mockLogger),
        act: (cubit) => cubit.register(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
        expect: () => [const RegistrationLoadingState(), const RegistrationErrorState()],
        verify: (_) {
          verify(
            mockLogger.error(
              runtimeType: RegistrationCubit,
              operation: 'register',
              exc: anyNamed('exc'),
              st: anyNamed('st'),
            ),
          ).called(1);
        },
      );

      blocTest<RegistrationCubit, RegistrationState>(
        'passes raw email to use cases (trim is their responsibility)',
        setUp: () {
          when(
            mockValidate(
              email: anyNamed('email'),
              password: anyNamed('password'),
              confirmPassword: anyNamed('confirmPassword'),
            ),
          ).thenReturn({});

          when(
            mockRegister(email: anyNamed('email'), password: anyNamed('password')),
          ).thenAnswer((_) async => (accessToken: accessToken, refreshToken: refreshToken));
        },
        build: () => RegistrationCubit(mockValidate, mockRegister, mockLogger),
        act: (cubit) => cubit.register(
          email: '  $email  ',
          password: password,
          confirmPassword: confirmPassword,
        ),
        verify: (_) {
          verify(
            mockValidate(
              email: '  $email  ',
              password: password,
              confirmPassword: confirmPassword,
            ),
          ).called(1);
          verify(mockRegister(email: '  $email  ', password: password)).called(1);
        },
      );
    });
  });
}
