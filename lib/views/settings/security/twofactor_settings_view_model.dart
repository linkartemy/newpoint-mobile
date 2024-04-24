import 'package:flutter/material.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/user/user.dart';
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
      if (user!.email == null) {
        error = "You need to have an email to enable two-factor authentication";
        return;
      } else {
        if (user!.email!.isEmpty) {
          error =
              "You need to have an email to enable two-factor authentication";
          return;
        }
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
