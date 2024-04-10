import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/code_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class AccountDeletionSettingsViewModel extends ChangeNotifier {
  AccountDeletionSettingsViewModel();

  final _userService = UserService();
  final _codeService = CodeService();

  User? user;
  String success = "";
  String error = "";
  int step = 1;

  bool verifyCodeButtonAvailable = true;
  bool resendCodeButtonAvailable = true;
  int resendCodeCountDown = 0;
  Timer timer = Timer(Duration(seconds: 1), () {});

  TextEditingController codeFieldText = TextEditingController();

  void setError(String message) {
    error = message;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 5000), () {
      error = "";
      notifyListeners();
    });
  }

  Future<void> getUser() async {
    try {
      user = await _userService.getUser();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      error = e.error;
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    notifyListeners();
  }

  Future<void> sendCode() async {
    try {
      await _codeService.addEmailVerificationCode(user!.email!);
      step = 2;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      error = e.error;
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    notifyListeners();
  }

  Future<void> resendCode() async {
    try {
      resendCodeCountDown = 60;
      _codeService.addEmailVerificationCode(user!.email!);
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) {
          if (resendCodeCountDown == 0) {
            timer.cancel();
            resendCodeButtonAvailable = true;
            notifyListeners();
          } else {
            --resendCodeCountDown;
            notifyListeners();
          }
        },
      );
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

  Future<bool> verifyCode() async {
    try {
      final code = codeFieldText.text;
      if (code.isEmpty) {
        setError("Code cannot be empty");
        return false;
      }
      final verified =
          await _codeService.verifyEmailVerificationCode(user!.email!, code);
      if (!verified) {
        setError("Incorrect code");
        return false;
      }
      await _userService.logout();
      notifyListeners();
      return true;
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      error = e.error;
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    notifyListeners();
    return false;
  }
}
