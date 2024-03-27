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

class AccountSettingsViewModel extends ChangeNotifier {
  AccountSettingsViewModel();

  final _userService = UserService();
  final _postService = PostService();
  final _codeService = CodeService();
  final postViewEntryTable = PostViewEntryTable();

  User? user;
  int stepEmail = 1;
  String successPhone = "";
  String successEmail = "";
  String error = "";
  String errorPhone = "";
  String errorEmail = "";

  bool verifyEmailButtonAvailable = true;
  bool resendCodeButtonAvailable = true;
  int resendCodeCountDown = 0;
  Timer timer = Timer(const Duration(seconds: 1), () {});

  String? currentPhone;
  String? currentEmail;
  TextEditingController phoneFieldText = TextEditingController();
  TextEditingController emailFieldText = TextEditingController();
  TextEditingController emailCodeFieldText = TextEditingController();

  Future<void> getUser() async {
    try {
      user = await _userService.getUser();
      phoneFieldText.text = user!.phone!;
      emailFieldText.text = user!.email!;
      currentPhone = user!.phone;
      currentEmail = user!.email;
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

  Future<void> changePhone() async {
    try {
      errorPhone = "";
      final phone = phoneFieldText.text;
      if (phone.isEmpty) {
        errorPhone = "Phone number cannot be empty";
        notifyListeners();
        Future.delayed(const Duration(seconds: 5), () {
          errorPhone = "";
          notifyListeners();
        });
        return;
      }
      if (phone == currentPhone) {
        return;
      }
      phoneFieldText.text = "";
      successPhone = "Phone number successfully changed";
      Future.delayed(const Duration(seconds: 5), () {
        successPhone = "";
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

  Future<void> resendCode() async {
    try {
      final email = emailFieldText.text;
      if (email.isEmpty) {
        errorEmail = "Email cannot be empty";
        notifyListeners();
        Future.delayed(const Duration(seconds: 5), () {
          errorEmail = "";
          notifyListeners();
        });
        return;
      }
      resendCodeCountDown = 60;
      _codeService.addEmailVerificationCode(email);
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

  Future<void> changeEmail() async {
    try {
      errorEmail = "";
      final email = emailFieldText.text;
      if (email.isEmpty) {
        errorEmail = "Email cannot be empty";
        notifyListeners();
        Future.delayed(const Duration(seconds: 5), () {
          errorEmail = "";
          notifyListeners();
        });
        return;
      }
      if (email == currentEmail) {
        return;
      }
      resendCodeCountDown = 0;
      resendCodeButtonAvailable = true;
      _codeService.addEmailVerificationCode(email);
      stepEmail = 2;
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

  Future<void> verifyEmail() async {
    try {
      final email = emailFieldText.text;
      final code = emailCodeFieldText.text;
      if (code.isEmpty) {
        errorEmail = "Code cannot be empty";
        notifyListeners();
        Future.delayed(const Duration(seconds: 5), () {
          errorEmail = "";
          notifyListeners();
        });
        return;
      }
      final verified = await _codeService.verifyEmailVerificationCode(email, code);
      if (!verified) {
        errorEmail = "Incorrect code";
        notifyListeners();
        Future.delayed(const Duration(seconds: 5), () {
          errorEmail = "";
          notifyListeners();
        });
        return;
      }
      await _userService.changeEmail(email);
      emailCodeFieldText.text = "";
      currentEmail = email;
      stepEmail = 1;
      successEmail = "Email successfully changed";
      Future.delayed(const Duration(seconds: 5), () {
        successEmail = "";
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
    notifyListeners();
  }
}
