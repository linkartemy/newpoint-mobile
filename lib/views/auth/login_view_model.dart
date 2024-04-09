import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/services/user_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';

class LoginViewModel extends ChangeNotifier {
  final _userService = UserService();
  final _codeService = CodeService();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final codeTextController = TextEditingController();

  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;

  bool get isAuthProgress => _isAuthProgress;

  String? token;
  int step = 1;
  bool twoFactor = false;

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

    _errorMessage = await _login(login, password);
    if (_errorMessage == null) {
      step = 2;
      _updateState(null, true);
    } else {
      _updateState(_errorMessage, false);
    }
  }

  Future<void> resendCode() async {
    try {
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

  Future<void> verifyCode() async {
    try {
      final code = codeFieldText.text;
      if (code.isEmpty) {
        setError("Code cannot be empty");
        return;
      }
      final verified = await _codeService.verifyPasswordChangeVerificationCode(
          user!.email, user!.phone, code);
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

  void _updateState(String? errorMessage, bool isAuthProgress) {
    if (_errorMessage == errorMessage && _isAuthProgress == isAuthProgress) {
      return;
    }
    _errorMessage = errorMessage;
    _isAuthProgress = isAuthProgress;
    passwordTextController.clear();
    Future.delayed(
        const Duration(milliseconds: 5000),
        () => {
              _errorMessage = null,
              notifyListeners(),
            });
    notifyListeners();
  }
}
