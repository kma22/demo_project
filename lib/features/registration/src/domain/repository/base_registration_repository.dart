/// Контракт репозитория регистрации.
abstract interface class BaseRegistrationRepository {
  Future<({String accessToken, String refreshToken})> register({
    required String email,
    required String password,
  });
}
