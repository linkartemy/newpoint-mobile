import 'package:flutter/material.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/post.dart';
import 'package:newpoint/domain/services/post_service.dart';

class MainViewModel extends ChangeNotifier {
  final _postService = PostService();
  var _posts = <Post>[];
  var isLoadingPosts = false;
  String postsLoadingError = "";

  MainViewModel() {}

  Future<void> getPosts() async {
    try {
      postsLoadingError = "";
      isLoadingPosts = true;
      List<Post> posts = await _postService.get();
      _posts = posts;
      isLoadingPosts = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      postsLoadingError = "Something went wrong, please try again";
    }
  }

  List<Post> posts() => _posts;
}
