import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:demo_project/app/session/domain/base_session_repository.dart';
import 'package:demo_project/app/session/presentation/cubit/session_cubit.dart';
import 'package:demo_project/core/logger_manager/logger_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<BaseSessionRepository>(), MockSpec<AppLogger>()])
import 'session_cubit_test.mocks.dart';

void main() {
  late MockBaseSessionRepository mockRepo;
  late MockAppLogger mockLogger;
  late StreamController<void> sessionExpiredController;

  setUp(() {
    mockRepo = MockBaseSessionRepository();
    mockLogger = MockAppLogger();
    sessionExpiredController = StreamController<void>.broadcast();

    when(mockRepo.onSessionExpired).thenAnswer((_) => sessionExpiredController.stream);
  });

  tearDown(() {
    sessionExpiredController.close();
  });

  group('SessionCubit', () {
    group('init', () {
      blocTest<SessionCubit, SessionState>(
        'emits [AuthenticatedState] when tokens exist',
        setUp: () => when(mockRepo.hasActiveSession()).thenAnswer((_) async => true),
        build: () => SessionCubit(mockRepo, mockLogger),
        act: (cubit) => cubit.init(),
        expect: () => [const AuthenticatedState()],
      );

      blocTest<SessionCubit, SessionState>(
        'emits [UnauthenticatedState] when no tokens',
        setUp: () => when(mockRepo.hasActiveSession()).thenAnswer((_) async => false),
        build: () => SessionCubit(mockRepo, mockLogger),
        act: (cubit) => cubit.init(),
        expect: () => [const UnauthenticatedState()],
      );

      blocTest<SessionCubit, SessionState>(
        'emits [UnauthenticatedState] on init error',
        setUp: () =>
            when(mockRepo.hasActiveSession()).thenAnswer((_) async => throw Exception('fail')),
        build: () => SessionCubit(mockRepo, mockLogger),
        act: (cubit) => cubit.init(),
        expect: () => [const UnauthenticatedState()],
        verify: (_) {
          verify(
            mockLogger.error(
              runtimeType: anyNamed('runtimeType'),
              operation: 'init',
              msg: anyNamed('msg'),
              exc: anyNamed('exc'),
              st: anyNamed('st'),
            ),
          ).called(1);
        },
      );
    });

    group('onLoginSuccess', () {
      blocTest<SessionCubit, SessionState>(
        'saves session and emits [AuthenticatedState]',
        setUp: () {
          when(mockRepo.hasActiveSession()).thenAnswer((_) async => false);
          when(mockRepo.saveSession(any, any)).thenAnswer((_) async {});
        },
        build: () => SessionCubit(mockRepo, mockLogger),
        act: (cubit) async {
          await cubit.init();
          await cubit.onLoginSuccess(accessToken: 'access', refreshToken: 'refresh');
        },
        expect: () => [const UnauthenticatedState(), const AuthenticatedState()],
        verify: (_) => verify(mockRepo.saveSession('access', 'refresh')).called(1),
      );

      blocTest<SessionCubit, SessionState>(
        'emits [UnauthenticatedState] on save error',
        setUp: () {
          when(mockRepo.hasActiveSession()).thenAnswer((_) async => false);
          when(
            mockRepo.saveSession(any, any),
          ).thenAnswer((_) async => throw Exception('storage fail'));
        },
        build: () => SessionCubit(mockRepo, mockLogger),
        act: (cubit) async {
          await cubit.init();
          await cubit.onLoginSuccess(accessToken: 'access', refreshToken: 'refresh');
        },
        expect: () => [const UnauthenticatedState()],
      );
    });

    group('logout', () {
      blocTest<SessionCubit, SessionState>(
        'clears session and emits [UnauthenticatedState]',
        setUp: () {
          when(mockRepo.hasActiveSession()).thenAnswer((_) async => true);
          when(mockRepo.clearSession()).thenAnswer((_) async {});
        },
        build: () => SessionCubit(mockRepo, mockLogger),
        act: (cubit) async {
          await cubit.init();
          await cubit.logout();
        },
        expect: () => [const AuthenticatedState(), const UnauthenticatedState()],
        verify: (_) => verify(mockRepo.clearSession()).called(1),
      );

      blocTest<SessionCubit, SessionState>(
        'emits [UnauthenticatedState] even if clear fails',
        setUp: () {
          when(mockRepo.hasActiveSession()).thenAnswer((_) async => true);
          when(mockRepo.clearSession()).thenAnswer((_) async => throw Exception('fail'));
        },
        build: () => SessionCubit(mockRepo, mockLogger),
        act: (cubit) async {
          await cubit.init();
          await cubit.logout();
        },
        expect: () => [const AuthenticatedState(), const UnauthenticatedState()],
      );
    });

    group('session expired', () {
      blocTest<SessionCubit, SessionState>(
        'emits [UnauthenticatedState(sessionExpired: true)] on 401',
        setUp: () {
          when(mockRepo.hasActiveSession()).thenAnswer((_) async => true);
          when(mockRepo.clearSession()).thenAnswer((_) async {});
        },
        build: () => SessionCubit(mockRepo, mockLogger),
        act: (cubit) async {
          await cubit.init();
          sessionExpiredController.add(null);
        },
        wait: const Duration(milliseconds: 50),
        expect: () => [
          const AuthenticatedState(),
          const UnauthenticatedState(sessionExpired: true),
        ],
      );

      blocTest<SessionCubit, SessionState>(
        'ignores session expired when already unauthenticated',
        setUp: () {
          when(mockRepo.hasActiveSession()).thenAnswer((_) async => false);
        },
        build: () => SessionCubit(mockRepo, mockLogger),
        act: (cubit) async {
          await cubit.init();
          sessionExpiredController.add(null);
        },
        wait: const Duration(milliseconds: 50),
        expect: () => [const UnauthenticatedState()],
        verify: (_) {
          verifyNever(mockRepo.clearSession());
        },
      );
    });
  });
}
