import 'package:newpoint/domain/api_clients/account_api_client.dart';
import 'package:newpoint/domain/api_clients/auth_api_client.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';

class AuthService {
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();
  final _sessionDataProvider = SessionDataProvider();

  Future<bool> isAuth() async {
    final token = await _sessionDataProvider.getToken();
    return token != null;
  }

  Future<void> register(String login, String password, String name,
      String surname, String email, String phone, DateTime birthDate) async {
    final token = await _authApiClient.register(
        login: login,
        password: password,
        name: name,
        surname: surname,
        email: email,
        phone: phone,
        birthDate: birthDate.toString());
    //final accountId = await _accountApiClient.getAccountInfo(token);
    await _sessionDataProvider.setToken(token);
    //await _sessionDataProvider.setAccountId(accountId);
  }

  Future<void> login(String login, String password) async {
    final token = await _authApiClient.auth(
      login: login,
      password: password,
    );
    //final accountId = await _accountApiClient.getAccountInfo(token);
    await _sessionDataProvider.setToken(token);
    //await _sessionDataProvider.setAccountId(accountId);
  }

  Future<void> logout() async {
    await _sessionDataProvider.deleteToken();
    await _sessionDataProvider.deleteAccountId();
  }
}
