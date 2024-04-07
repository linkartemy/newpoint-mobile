import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpoint/domain/data_providers/blacklist_data_provider.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class TwoFactorSettingsViewModel extends ChangeNotifier {
  TwoFactorSettingsViewModel();

  final _userService = UserService();
  final _sessionDataProvider = SessionDataProvider();

  User? user;
  String error = "";

  bool twoFactorEnabled = false;
  bool processingTwoFactor = false;

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

  Future<void> getTwoFactorSettings() async {
    try {
      twoFactorEnabled = await _userService
          .getTwoFactorByToken((await _sessionDataProvider.getToken())!);
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

  Future<void> setTwoFactorSettings(bool value) async {
    try {
      if (processingTwoFactor) {
        return;
      }
      processingTwoFactor = true;
      twoFactorEnabled = value;
      await _userService.updateTwoFactor(value);
      Future.delayed(const Duration(seconds: 1), () {
        processingTwoFactor = false;
        notifyListeners();
      });
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
