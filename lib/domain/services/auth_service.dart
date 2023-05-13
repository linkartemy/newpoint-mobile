import 'package:newpoint/domain/api_clients/account_api_client.dart';
import 'package:newpoint/domain/api_clients/auth_api_client.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';

class AuthService {
  final _authApiClient = AuthApiClient();
  final _accountApiClient = AccountApiClient();
  final _sessionDataProvider = SessionDataProvider();

  Future<bool> isAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    return sessionId != null;
  }

  Future<void> register(String login, String password, String name, String surname, String email, String phone) async {
    final sessionId = await _authApiClient.register(
      login: login,
      password: password,
      name: name,
      surname: surname,
      email: email,
      phone: phone,
    );
  }

  Future<void> login(String login, String password) async {
    final sessionId = await _authApiClient.auth(
      username: login,
      password: password,
    );
    final accountId = await _accountApiClient.getAccountInfo(sessionId);
    await _sessionDataProvider.setSessionId(sessionId);
    await _sessionDataProvider.setAccountId(accountId);
  }

  Future<void> logout() async {
    await _sessionDataProvider.deleteSessionId();
    await _sessionDataProvider.deleteAccountId();
  }
}