/// Контракт управления сессией пользователя.
///
/// Абстрагирует хранение токенов и наблюдение за истечением сессии.
abstract interface class BaseSessionRepository {
  Future<bool> hasActiveSession();

  Future<void> saveSession(String accessToken, String refreshToken);

  Future<void> clearSession();

  Stream<void> get onSessionExpired;
}
