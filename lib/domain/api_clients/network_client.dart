import 'dart:convert';
import 'dart:io';

import 'package:newpoint/configuration/configuration.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/models/network/response.dart';

class NetworkClient {
  final _client = HttpClient();
  final _sessionDataProvider = SessionDataProvider();

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('${Configuration.apiHost}$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<T> get<T>(
    String path,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? parameters,
  ]) async {
    final url = _makeUri(path, parameters);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<Response> post<T>(
    String path,
    T Function(dynamic json) parser,
    Map<String, dynamic>? bodyParameters, [
    Map<String, dynamic>? headersParameters,
    Map<String, dynamic>? urlParameters,
  ]) async {
    try {
      final url = _makeUri(path);
      final request = await _client.postUrl(url);

      request.headers.contentType = ContentType.json;
      headersParameters?.forEach((key, value) {
        request.headers.add(key, value);
      });
      request.write(jsonEncode(bodyParameters));
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);

      final result = parser(json["data"]);
      return Response(body: result, headers: response.headers);
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      print(e.toString());
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<Response> postAuthorized<T>(
    String path,
    T Function(dynamic json) parser,
    Map<String, dynamic>? bodyParameters, [
    Map<String, dynamic>? headersParameters,
    Map<String, dynamic>? urlParameters,
  ]) async {
    try {
      if (!(await _sessionDataProvider.hasToken())) {
        throw ApiClientException(ApiClientExceptionType.auth);
      }
      final url = _makeUri(path);
      final request = await _client.postUrl(url);

      request.headers.contentType = ContentType.json;
      headersParameters?.forEach((key, value) {
        request.headers.add(key, value);
      });
      request.headers.add("Authorization",
          "bearer ${(await _sessionDataProvider.getToken())!}");
      request.write(jsonEncode(bodyParameters));
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);

      final result = parser(json["data"]);
      return Response(body: result, headers: response.headers);
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      print(e.toString());
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    if (json["error"] == null && json["data"] == null) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
    switch (response.statusCode) {
      case 200:
        if (json["error"] != null && json["error"] != "") {
          throw ApiClientException.fromError(
              ApiClientExceptionType.other, json["error"]);
        }
        break;
      case 401:
        throw ApiClientException(ApiClientExceptionType.auth);
      case 400:
        if (json["error"] != null && json["error"] != "") {
          throw ApiClientException.fromError(
              ApiClientExceptionType.badRequest, json["error"]);
        }
        break;
      default:
        throw ApiClientException(ApiClientExceptionType.other);
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder).toList().then((value) {
      final result = value.join();
      return result;
    }).then<dynamic>((v) => json.decode(v));
  }
}
