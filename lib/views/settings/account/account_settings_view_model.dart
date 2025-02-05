import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/code_service.dart';
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

  void setEmailError(String message) {
    errorEmail = message;
    notifyListeners();
    Future.delayed(const Duration(seconds: 5), () {
      errorEmail = "";
      notifyListeners();
    });
  }

  void setPhoneError(String message) {
    errorPhone = message;
    notifyListeners();
    Future.delayed(const Duration(seconds: 5), () {
      errorPhone = "";
      notifyListeners();
    });
  }

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
        setPhoneError("Phone number cannot be empty");
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
        setEmailError("Email cannot be empty");
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
        setEmailError("Email cannot be empty");
        return;
      }
      if (email == currentEmail) {
        return;
      }
      if (!EmailValidator.validate(email)) {
        setEmailError("Email is invalid");
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
        setEmailError("Code cannot be empty");
        return;
      }
      final verified =
          await _codeService.verifyEmailVerificationCode(email, code);
      if (!verified) {
        setEmailError("Incorrect code");
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
