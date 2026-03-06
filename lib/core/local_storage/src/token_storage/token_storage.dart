import 'dart:convert';

import 'package:demo_project/core/local_storage/src/storage_keys.dart';
import 'package:demo_project/core/local_storage/src/token_storage/base_token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseTokenStorage)
class TokenStorage implements BaseTokenStorage {
  final FlutterSecureStorage _secureStorage;

  TokenStorage(this._secureStorage);

  ({String accessToken, String refreshToken})? _cachedTokens;
  bool _isInitialized = false;

  @override
  Future<({String accessToken, String refreshToken})?> getTokens() async {
    await _ensureInitialized();
    return _cachedTokens;
  }

  Future<void> _ensureInitialized() async {
    if (_isInitialized) return;
    _cachedTokens = await _readTokens();
    _isInitialized = true;
  }

  Future<({String accessToken, String refreshToken})?> _readTokens() async {
    String? res;
    try {
      res = await _secureStorage.read(key: StorageKeys.token);
      if (res == null) return null;
    } on Object catch (_) {
      await _secureStorage.deleteAll();
      return null;
    }

    final decoded = jsonDecode(res);

    if (decoded is Map<String, dynamic>) {
      final accessToken = decoded[StorageKeys.accessTokenMapKey];
      final refreshToken = decoded[StorageKeys.refreshTokenMapKey];

      if (accessToken is String && refreshToken is String) {
        return (accessToken: accessToken, refreshToken: refreshToken);
      }
    }

    return null;
  }

  @override
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    _cachedTokens = (accessToken: accessToken, refreshToken: refreshToken);
    _isInitialized = true;

    final tokens = {
      StorageKeys.accessTokenMapKey: accessToken,
      StorageKeys.refreshTokenMapKey: refreshToken,
    };

    final converted = jsonEncode(tokens);
    await _secureStorage.write(key: StorageKeys.token, value: converted);
  }

  @override
  Future<void> clear() async {
    _cachedTokens = null;
    await _secureStorage.delete(key: StorageKeys.token);
  }
}
