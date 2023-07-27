import 'package:newpoint/domain/api_clients/comment_api_client.dart';
import 'package:newpoint/domain/api_clients/post_api_client.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/models/comment/comment.dart';

class CommentService {
  final _commentApiClient = CommentApiClient();

  Future<List<Comment>> get(int id) async {
    return await _commentApiClient.get(id);
  }

  Future<bool> like(int id) async {
    return await _commentApiClient.like(id);
  }

  Future<bool> unlike(int id) async {
    return await _commentApiClient.unlike(id);
  }
}
