import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';

class AuthViewModel extends ChangeNotifier {
  final _authService = AuthService();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;

  bool get isAuthProgress => _isAuthProgress;

  bool _isValid(String login, String password) =>
      login.isNotEmpty && password.isNotEmpty;

  Future<String?> _login(String login, String password) async {
    try {
      await _authService.login(login, password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          return 'Сервер не доступен. Проверте подключение к интернету';
        case ApiClientExceptionType.auth:
          return 'Неправильный логин пароль!';
        case ApiClientExceptionType.sessionExpired:
        case ApiClientExceptionType.other:
          return 'Произошла ошибка. Попробуйте еще раз';
      }
    } catch (e) {
      return 'Неизвестная ошибка, поторите попытку';
    }
    return null;
  }

  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;

    if (!_isValid(login, password)) {
      _updateState('Заполните логин и пароль', false);
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
    notifyListeners();
  }
}
