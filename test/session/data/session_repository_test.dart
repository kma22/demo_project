import 'dart:async';

import 'package:api_client/api_client.dart';
import 'package:demo_project/session/data/session_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage/local_storage.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'session_repository_test.mocks.dart';

@GenerateMocks([BaseTokenStorage, SessionObserver])
void main() {
  late MockBaseTokenStorage mockTokenStorage;
  late MockSessionObserver mockSessionObserver;
  late SessionRepository repository;
  late StreamController<void> sessionExpiredController;

  setUp(() {
    mockTokenStorage = MockBaseTokenStorage();
    mockSessionObserver = MockSessionObserver();
    sessionExpiredController = StreamController<void>.broadcast();

    when(mockSessionObserver.onSessionExpired).thenAnswer((_) => sessionExpiredController.stream);

    repository = SessionRepository(mockTokenStorage, mockSessionObserver);
  });

  tearDown(() {
    sessionExpiredController.close();
  });

  group('SessionRepository', () {
    group('hasActiveSession', () {
      test('returns true when tokens exist', () async {
        when(
          mockTokenStorage.getTokens(),
        ).thenAnswer((_) async => (accessToken: 'access', refreshToken: 'refresh'));

        final result = await repository.hasActiveSession();

        expect(result, isTrue);
      });

      test('returns false when no tokens', () async {
        when(mockTokenStorage.getTokens()).thenAnswer((_) async => null);

        final result = await repository.hasActiveSession();

        expect(result, isFalse);
      });
    });

    group('saveSession', () {
      test('delegates to token storage', () async {
        when(mockTokenStorage.saveTokens(any, any)).thenAnswer((_) async {});

        await repository.saveSession('access', 'refresh');

        verify(mockTokenStorage.saveTokens('access', 'refresh')).called(1);
      });
    });

    group('clearSession', () {
      test('delegates to token storage', () async {
        when(mockTokenStorage.clear()).thenAnswer((_) async {});

        await repository.clearSession();

        verify(mockTokenStorage.clear()).called(1);
      });
    });

    group('onSessionExpired', () {
      test('proxies session observer stream', () async {
        final events = <void>[];
        final sub = repository.onSessionExpired.listen(events.add);

        sessionExpiredController.add(null);
        await Future<void>.delayed(Duration.zero);

        expect(events, hasLength(1));

        await sub.cancel();
      });
    });
  });
}
