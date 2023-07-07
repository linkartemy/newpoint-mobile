import 'dart:convert';

import 'package:newpoint/domain/api_clients/network_client.dart';
import 'package:newpoint/domain/models/post.dart';

class PostApiClient {
  static const String _apiUrl = "/post/";
  final _networkClient = NetworkClient();

  Future<List<Post>> get() async {
    List<Post> parser(dynamic data) {
      Iterable list = data[0]["data"];
      List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
      return posts;
    }

    final posts = await _networkClient.post(
      '${_apiUrl}get',
      parser,
      <String, dynamic>{
      },
      <String, dynamic>{
      }
    );
    return posts;
  }
}
