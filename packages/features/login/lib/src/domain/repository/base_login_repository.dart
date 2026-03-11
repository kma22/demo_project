/// Контракт репозитория авторизации.
abstract interface class BaseLoginRepository {
  Future<({String accessToken, String refreshToken})> login({
    required String email,
    required String password,
  });
}
