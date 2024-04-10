import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys {
  static const sensitiveContent = 'sensitive_content';
}

class SettingsDataProvider {
  static const _secureStorage = FlutterSecureStorage();

  Future<void> initialize() async {
    if (await _secureStorage.containsKey(key: _Keys.sensitiveContent) == false) {
      await _secureStorage.write(
          key: _Keys.sensitiveContent, value: false.toString());
    }
  }

  void setSensitiveContentSettings(bool value) {
    _secureStorage.write(
        key: _Keys.sensitiveContent, value: value.toString());
  }

  Future<bool> getSensitiveContentSettings() async {
    return bool.parse(await _secureStorage.read(key: _Keys.sensitiveContent) ?? "false");
  }
}
