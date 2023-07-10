import 'dart:io';

import 'package:newpoint/configuration/configuration.dart';
import 'package:newpoint/domain/api_clients/network_client.dart';

class AuthApiClient {
  final _networkClient = NetworkClient();
  static const _url = "/user";

  Future<String> auth({
    required String login,
    required String password,
  }) async {
    dynamic parser(dynamic json) {
      final data = json as List<dynamic>;
      if (data.isNotEmpty) {
        return data[0]['data'] as Map<String, dynamic>;
      }
      return json;
    }

    final parameters = <String, dynamic>{
      'login': login,
      'password': password,
    };
    var response = await _networkClient.post(
      "$_url/login",
      parser,
      parameters,
    );
    return response.headers["Authorization"][0];
  }

  Future<String> register(
      {required String login,
      required String password,
      required String name,
      required String surname,
      required String email,
      required String phone,
      required String birthDate}) async {
    dynamic parser(dynamic json) {
      final data = json as List<dynamic>;
      if (data.isNotEmpty) {
        return data[0]['data'] as Map<String, dynamic>;
      }
      return json;
    }

    final parameters = <String, dynamic>{
      'login': login,
      'password': password,
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
      'birthDate': birthDate
    };
    var response = await _networkClient.post(
      "$_url/register",
      parser,
      parameters,
    );
    return response.headers["Authorization"][0];
  }

  // Future<String> _makeToken() async {
  //   String parser(dynamic json) {
  //     final jsonMap = json as Map<String, dynamic>;
  //     final token = jsonMap['request_token'] as String;
  //     return token;
  //   }
  //
  //   final result = _networkClient.get(
  //     _url + "/token",
  //     parser,
  //     <String, dynamic>{'api_key': Configuration.apiKey},
  //   );
  //   return result;
  // }

  Future<String> _validateUser({
    required String login,
    required String password,
    required String requestToken,
  }) async {
    String parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    }

    final parameters = <String, dynamic>{
      'username': login,
      'password': password,
      'request_token': requestToken,
    };
    final response = await _networkClient.post(
      _url + "/validate_with_login",
      parser,
      parameters,
      <String, dynamic>{'api_key': Configuration.apiKey},
    );
    return response.body;
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
    final response = await _networkClient.post(
      '/authentication/session/new',
      parser,
      parameters,
      <String, dynamic>{'api_key': Configuration.apiKey},
    );
    return response.body;
  }
}
