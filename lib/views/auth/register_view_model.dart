import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/domain/services/code_service.dart';
import 'package:newpoint/domain/services/user_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:email_validator/email_validator.dart';

class RegisterViewModel extends ChangeNotifier {
  final _userService = UserService();
  final _codeService = CodeService();

  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final passwordVerificationTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  final codeTextController = TextEditingController();

  final birthDateController = TextEditingController();

  var birthDate = DateTime.now();

  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  bool _isAuthProgress = false;

  bool get canStartAuth => !_isAuthProgress;

  bool get isAuthProgress => _isAuthProgress;

  bool _isValid(String login, String password, String name, String surname,
          String email) =>
      login.isNotEmpty &&
      password.isNotEmpty &&
      name.isNotEmpty &&
      surname.isNotEmpty &&
      email.isNotEmpty;

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
          return 'Something went wrong, please try again later (bad request)';
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
    try {
      final login = loginTextController.text;
      final password = passwordTextController.text;
      final passwordVerification = passwordVerificationTextController.text;
      final name = nameTextController.text;
      final surname = surnameTextController.text;
      final email = emailTextController.text;
      final phone = phoneTextController.text;
      final code = codeTextController.text;

      if (!_isValid(login, password, name, surname, email)) {
        _updateState('You must fill all fields', false);
        return;
      }

      if (!EmailValidator.validate(email)) {
        _updateState('Email is invalid', false);
        return;
      }

      if (password != passwordVerification) {
        _updateState('Passwords are not the same', false);
        return;
      }

      _updateState(null, true);

      if (stage == 0) {
        await _userService.validateUser(
            login, password, name, surname, email, phone);
        await _codeService.addEmailCode(email);
        stage++;
        _updateState(null, false);
        return;
      }

      if (stage == 1) {
        var verified = await _codeService.verifyEmailCode(email, code);
        if (!verified) {
          _updateState("Incorrect code", false);
          return;
        }
        _updateState(null, false);
        stage++;
        return;
      }

      _errorMessage =
          await _register(login, password, name, surname, email, '', birthDate);
      if (_errorMessage == null) {
        MainNavigation.resetNavigation(context);
      } else {
        _updateState(_errorMessage, false);
      }
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        _errorMessage = "Something is wrong with the connection to the server";
      } else {
        _errorMessage = e.error;
        _updateState(_errorMessage, false);
      }
    } catch (e) {
      _errorMessage = "Something went wrong, please try again";
    }
    _updateState(_errorMessage, false);
  }

  Future<void> goBack() async {
    if (stage > 0) {
      stage--;
      _updateState(null, false);
      return;
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
