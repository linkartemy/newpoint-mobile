import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const token = 'session_id';
  static const accountId = 'account_id';
}

class SessionDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getToken() => _secureStorage.read(key: _Keys.token);

  Future<void> setToken(String value) {
    return _secureStorage.write(key: _Keys.token, value: value);
  }

  Future<void> deleteToken() {
    return _secureStorage.delete(key: _Keys.token);
  }

  Future<int?> getAccountId() async {
    final id = await _secureStorage.read(key: _Keys.accountId);
    return id != null ? int.tryParse(id) : null;
  }

  Future<void> setAccountId(int value) {
    return _secureStorage.write(
      key: _Keys.accountId,
      value: value.toString(),
    );
  }

  Future<void> deleteAccountId() {
    return _secureStorage.delete(key: _Keys.accountId);
  }

  Future<bool> hasToken() {
    return _secureStorage.containsKey(key: _Keys.token);
  }
}
