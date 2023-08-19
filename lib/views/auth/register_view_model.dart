import 'package:flutter/material.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/domain/services/user_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';

class RegisterViewModel extends ChangeNotifier {
  final _userService = UserService();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;
  bool _isValid(String login, String password) =>
      login.isNotEmpty && password.isNotEmpty;

  int stage = 0;

  Future<String?> _register(String login, String password, String name,
      String surname, String email, String phone, DateTime birthDate) async {
    try {
      await _userService.register(
          login, password, name, surname, email, phone, birthDate);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          return 'No access to server. Check the Internet connection.';
        case ApiClientExceptionType.auth:
          return 'Неправильный логин пароль!';
        case ApiClientExceptionType.badRequest:
          if (e.error.isNotEmpty) {
            return e.error;
          }
          return 'Something went wrong, please try again later';
        case ApiClientExceptionType.sessionExpired:
        case ApiClientExceptionType.other:
          if (e.error.isNotEmpty) {
            return e.error;
          }
          return 'Something went wrong, please try again later';
      }
    } catch (e) {
      return 'Unknown error, please try again later';
    }
    return null;
  }

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    final name = nameTextController.text;
    final surname = surnameTextController.text;
    final email = emailTextController.text;
    final phone = phoneTextController.text;

    if (!_isValid(login, password)) {
      _updateState('Заполните логин и пароль', false);
      return;
    }
    _updateState(null, true);

    if (stage != 2) {
      stage++;
      _updateState(null, false);
      return;
    }
    _errorMessage = await _register(
        login, password, name, surname, email, '', DateTime.now());
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
    notifyListeners();
  }
}
