import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/code_service.dart';
import 'package:newpoint/domain/services/user_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';

class LoginViewModel extends ChangeNotifier {
  final _userService = UserService();
  final _codeService = CodeService();
  final _sessionDataProvider = SessionDataProvider();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final codeTextController = TextEditingController();

  String? error;

  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;

  bool get isAuthProgress => _isAuthProgress;

  User? user;
  String? token;
  int step = 1;
  bool verifyCodeButtonAvailable = true;
  int resendCodeCountDown = 60;
  bool resendCodeButtonAvailable = true;
  Timer timer = Timer(Duration(seconds: 1), () {});

  bool twoFactor = false;

  void setError(String message) {
    error = message;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 5000), () {
      error = "";
      notifyListeners();
    });
  }

  void goBack() {
    token = null;
    step = 1;
    loginTextController.text = "";
    passwordTextController.text = "";
    codeTextController.text = "";
    error = null;
    notifyListeners();
  }

  Future<String?> _login(String login, String password) async {
    try {
      token = await _userService.login(login, password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          return "Check your network";
        case ApiClientExceptionType.auth:
          return "Invalid login or password";
        case ApiClientExceptionType.badRequest:
          if (e.error.isNotEmpty) {
            return e.error;
          }
          return 'Something went wrong, please try again later';
        case ApiClientExceptionType.sessionExpired:
        case ApiClientExceptionType.other:
          return "Something went wrong, try again";
      }
    } catch (e) {
      return "We are sorry. Server error. Try again later";
    }
    return null;
  }

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (login.isEmpty || password.isEmpty) {
      _updateState('Fill login and password', false);
      return;
    }

    _updateState(null, true);

    if (step == 1) {
      error = await _login(login, password);
      if (error == null) {
        user = await _userService.getUserByLogin(loginTextController.text);
        if (await _userService.getTwoFactorByToken(token!)) {
          twoFactor = true;
          step = 2;
        } else {
          _sessionDataProvider.setToken(token!);
          MainNavigation.resetNavigation(context);
        }
        _isAuthProgress = false;
        notifyListeners();
      } else {
        _updateState(error, false);
      }
    } else {
      await verifyCode(context);
    }
  }

  Future<void> resendCode() async {
    try {
      resendCodeCountDown = 60;
      _codeService.addEmailVerificationCode(user!.email!);
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

  Future<void> verifyCode(BuildContext context) async {
    try {
      final code = codeTextController.text;
      if (code.isEmpty) {
        setError("Code cannot be empty");
        return;
      }
      final verified =
          await _codeService.verifyEmailVerificationCode(user!.email!, code);
      if (!verified) {
        setError("Incorrect code");
        return;
      }
      error = "";
      _sessionDataProvider.setToken(token!);
      MainNavigation.resetNavigation(context);
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

  void _updateState(String? errorMessage, bool isAuthProgress) {
    if (error == errorMessage && _isAuthProgress == isAuthProgress) {
      passwordTextController.clear();
      return;
    }
    error = errorMessage;
    _isAuthProgress = isAuthProgress;
    Future.delayed(
        const Duration(milliseconds: 5000),
        () => {
              error = null,
              notifyListeners(),
            });
    notifyListeners();
  }
}
