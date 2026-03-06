/// Контракт репозитория авторизации.
abstract interface class BaseAuthRepository {
  Future<({String accessToken, String refreshToken})> login({
    required String email,
    required String password,
  });
}
