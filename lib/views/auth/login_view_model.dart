import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/services/user_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';

class LoginViewModel extends ChangeNotifier {
  final _userService = UserService();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;

  bool get isAuthProgress => _isAuthProgress;

  Future<String?> _login(String login, String password) async {
    try {
      await _userService.login(login, password);
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
      MainNavigation.resetNavigation(context);
    } else {
      _updateState(_errorMessage, false);
    }
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
