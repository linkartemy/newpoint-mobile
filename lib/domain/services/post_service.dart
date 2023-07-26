import 'package:newpoint/domain/api_clients/post_api_client.dart';
import 'package:newpoint/domain/data_providers/session_data_provider.dart';
import 'package:newpoint/domain/models/post.dart';

class PostService {
  final _postApiClient = PostApiClient();

  Future<List<Post>> get() async {
    return await _postApiClient.get();
  }

  Future<Post> getPost(int id) async {
    return await _postApiClient.getPost(id);
  }

  Future<bool> share(int id) async {
    return await _postApiClient.share(id);
  }

  Future<bool> like(int id) async {
    return await _postApiClient.like(id);
  }

  Future<bool> unlike(int id) async {
    return await _postApiClient.unlike(id);
  }
}
