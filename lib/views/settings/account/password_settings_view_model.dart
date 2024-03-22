import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/code_service.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class PasswordSettingsViewModel extends ChangeNotifier {
  PasswordSettingsViewModel();

  final _userService = UserService();
  final _postService = PostService();
  final _codeService = CodeService();
  final postViewEntryTable = PostViewEntryTable();

  User? user;
  String success = "";
  String error = "";
  int step = 1;

  bool changePasswordButtonAvailable = true;
  bool verifyCodeButtonAvailable = true;
  bool resendCodeButtonAvailable = true;
  int resendCodeCountDown = 0;
  Timer timer = Timer(Duration(seconds: 1), () {});

  TextEditingController currentPasswordFieldText = TextEditingController();
  TextEditingController newPasswordFieldText = TextEditingController();
  TextEditingController confirmNewPasswordFieldText = TextEditingController();
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

  Future<void> changePassword() async {
    try {
      if (currentPasswordFieldText.text.isEmpty ||
          newPasswordFieldText.text.isEmpty ||
          confirmNewPasswordFieldText.text.isEmpty) {
        setError("All fields are required");
        return;
      }
      if (newPasswordFieldText.text != confirmNewPasswordFieldText.text) {
        setError("New passwords do not match");
        return;
      }
      if (currentPasswordFieldText.text == newPasswordFieldText.text) {
        setError("New password cannot be the same as the current password");
        return;
      }
      if (!await _userService.verifyPassword(currentPasswordFieldText.text)) {
        currentPasswordFieldText.text = "";
        setError("Current password is incorrect");
        return;
      }
      _codeService.addEmailCode(user!.email!);
      step = 2;
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      } else {
        error = e.error;
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    notifyListeners();
  }

  Future<void> resendCode() async {
    try {
      final email = user!.email!;
      if (email.isEmpty) {
        error = "Email cannot be empty";
        notifyListeners();
        Future.delayed(const Duration(seconds: 5), () {
          error = "";
          notifyListeners();
        });
        return;
      }
      resendCodeCountDown = 60;
      _codeService.addEmailCode(email);
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

  Future<void> verifyCode() async {
    try {
      final code = codeFieldText.text;
      if (code.isEmpty) {
        setError("Code cannot be empty");
        return;
      }
      final verified = await _codeService.verifyEmailCode(user!.email!, code);
      if (!verified) {
        setError("Incorrect code");
        return;
      }
      await _userService.changePassword(
        currentPasswordFieldText.text,
        newPasswordFieldText.text,
      );
      currentPasswordFieldText.text = "";
      newPasswordFieldText.text = "";
      confirmNewPasswordFieldText.text = "";
      codeFieldText.text = "";
      error = "";
      success = "Password changed successfully";
      step = 1;
      Future.delayed(const Duration(milliseconds: 5000), () {
        success = "";
        notifyListeners();
      });
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
}
