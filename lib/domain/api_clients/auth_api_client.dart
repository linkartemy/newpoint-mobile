import 'package:newpoint/configuration/configuration.dart';
import 'package:newpoint/domain/api_clients/network_client.dart';

class AuthApiClient {
  final _networkClient = NetworkClient();
  static const _url = "/user";

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
      username: username,
      password: password,
      requestToken: token,
    );
    final sessionId = await _makeSession(requestToken: validToken);
    return sessionId;
  }

  Future<String> register({
    required String login,
    required String password,
    required String name,
    required String surname,
    required String email,
    required String phone,
  }) async {
    dynamic parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final data = jsonMap['data'] as List<dynamic>;
      return json;
    }

    final parameters = <String, dynamic>{
      'login': login,
      'password': password,
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
    };
    var response = await _networkClient.post(
      _url + "/register",
      parser,
      parameters,
    );

    print(response);
    return response["data"][0];
  }

  Future<String> _makeToken() async {
    String parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    }

    final result = _networkClient.get(
      _url + "/token",
      parser,
      <String, dynamic>{'api_key': Configuration.apiKey},
    );
    return result;
  }

  Future<String> _validateUser({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    String parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    }

    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken,
    };
    final result = _networkClient.post(
      _url + "/validate_with_login",
      parser,
      parameters,
      <String, dynamic>{'api_key': Configuration.apiKey},
    );
    return result;
  }

  Future<String> _makeSession({
    required String requestToken,
  }) async {
    String parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final sessionId = jsonMap['session_id'] as String;
      return sessionId;
    }

    final parameters = <String, dynamic>{
      'request_token': requestToken,
    };
    final result = _networkClient.post(
      '/authentication/session/new',
      parser,
      parameters,
      <String, dynamic>{'api_key': Configuration.apiKey},
    );
    return result;
  }
}
