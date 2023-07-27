import 'dart:convert';
import 'dart:io';

import 'package:newpoint/domain/api_clients/network_client.dart';
import 'package:newpoint/domain/models/comment/comment.dart';

class CommentApiClient {
  static const String _apiUrl = "/comment";
  final _networkClient = NetworkClient();

  Future<List<Comment>> get(int id) async {
    List<Comment> parser(dynamic data) {
      Iterable list = data[0]["data"];
      List<Comment> comments =
          list.map((comment) => Comment.fromJson(comment)).toList();
      return comments;
    }

    final response = await _networkClient.postAuthorized(
      '$_apiUrl/get',
      parser,
      <String, dynamic>{'id': id},
    );
    return response.body;
  }

  Future<bool> add(int postId, String content) async {
    bool parser(dynamic data) {
      return data[0]["data"];
    }

    final response = await _networkClient.postAuthorized(
      '$_apiUrl/add',
      parser,
      <String, dynamic>{'id': postId, 'content': content},
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
