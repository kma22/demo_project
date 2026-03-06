import 'package:demo_project/app/session/domain/base_session_repository.dart';
import 'package:demo_project/core/api_client/api_client.dart';
import 'package:demo_project/core/local_storage/local_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseSessionRepository)
class SessionRepository implements BaseSessionRepository {
  final BaseTokenStorage _tokenStorage;
  final SessionObserver _sessionObserver;

  SessionRepository(this._tokenStorage, this._sessionObserver);

  @override
  Future<bool> hasActiveSession() async {
    final tokens = await _tokenStorage.getTokens();
    return tokens != null;
  }

  @override
  Future<void> saveSession(String accessToken, String refreshToken) {
    return _tokenStorage.saveTokens(accessToken, refreshToken);
  }

  @override
  Future<void> clearSession() => _tokenStorage.clear();

  @override
  Stream<void> get onSessionExpired => _sessionObserver.onSessionExpired;
}
