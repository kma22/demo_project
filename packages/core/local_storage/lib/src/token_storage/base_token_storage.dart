abstract interface class BaseTokenStorage {
  Future<void> saveTokens(String accessToken, String refreshToken);

  Future<({String accessToken, String refreshToken})?> getTokens();

  Future<void> clear();
}
