import 'package:flutter/material.dart';
import 'package:newpoint/domain/data_providers/settings_data_provider.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class SensitiveContentSettingsViewModel extends ChangeNotifier {
  SensitiveContentSettingsViewModel();

  final _userService = UserService();
  final _postService = PostService();
  final _settingsDataProvider = SettingsDataProvider();

  bool sensitiveContent = false;

  User? user;
  String error = "";

  Future<void> getUser() async {
    try {
      user = await _userService.getUser();
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      error = e.error;
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> getSensitiveContentSettings() async {
    sensitiveContent =
        await _settingsDataProvider.getSensitiveContentSettings();
    notifyListeners();
  }

  void setSensitiveContentSettings(bool value) {
    _settingsDataProvider.setSensitiveContentSettings(value);
    sensitiveContent = value;
    notifyListeners();
  }
}
