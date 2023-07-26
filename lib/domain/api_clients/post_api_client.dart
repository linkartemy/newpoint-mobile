import 'dart:convert';
import 'dart:io';

import 'package:newpoint/domain/api_clients/network_client.dart';
import 'package:newpoint/domain/models/post.dart';

class PostApiClient {
  static const String _apiUrl = "/post";
  final _networkClient = NetworkClient();

  Future<List<Post>> get() async {
    List<Post> parser(dynamic data) {
      Iterable list = data[0]["data"];
      List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
      return posts;
    }

    final response = await _networkClient.postAuthorized(
      '$_apiUrl/get',
      parser,
      <String, dynamic>{},
    );
    return response.body;
  }

  Future<Post> getPost(int id) async {
    Post parser(dynamic data) {
      return Post.fromJson(data[0]["data"]);
    }

    final response = await _networkClient.postAuthorized(
      '$_apiUrl/get/post',
      parser,
      <String, dynamic>{'id': id},
    );
    return response.body;
  }

  Future<bool> share(int id) async {
    bool parser(dynamic data) {
      return data[0]["data"];
    }

    final response = await _networkClient.postAuthorized(
      '$_apiUrl/share',
      parser,
      <String, dynamic>{'id': id},
    );
    return response.body;
  }

  Future<bool> like(int id) async {
    bool parser(dynamic data) {
      return data[0]["data"];
    }

    final response = await _networkClient.postAuthorized(
      '$_apiUrl/like',
      parser,
      <String, dynamic>{'id': id},
    );
    return response.body;
  }

  Future<bool> unlike(int id) async {
    bool parser(dynamic data) {
      return data[0]["data"];
    }

    final response = await _networkClient.postAuthorized(
      '$_apiUrl/unlike',
      parser,
      <String, dynamic>{'id': id},
    );
    return response.body;
  }
}
