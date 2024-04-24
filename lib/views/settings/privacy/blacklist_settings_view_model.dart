import 'package:flutter/material.dart';
import 'package:newpoint/domain/data_providers/blacklist_data_provider.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/user_service.dart';

class BlacklistSettingsViewModel extends ChangeNotifier {
  BlacklistSettingsViewModel();

  final _userService = UserService();
  final _blacklistDataProvider = BlacklistDataProvider();

  User? user;
  String error = "";

  List<User> blacklist = [];

  TextEditingController settingsNameFieldText = TextEditingController();

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

  Future<void> getBlacklistSettings() async {
    try {
      final blacklistUserIds = await _blacklistDataProvider.getAll();
      blacklist = await Future.wait(blacklistUserIds.map((userId) async {
        return await _userService.getProfileById(userId);
      }));
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

  Future<void> removeUserFromBlacklist(int userId) async {
    try {
      await _blacklistDataProvider.remove(userId);
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
}
