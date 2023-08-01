import 'package:flutter/material.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class MainViewModel extends ChangeNotifier {
  final _postService = PostService();
  final _authService = UserService();
  var _posts = <Post>[];
  User? _user;
  var isLoadingPosts = false;
  String postsLoadingError = "";

  MainViewModel() {}

  Future<void> getPosts() async {
    try {
      postsLoadingError = "";
      isLoadingPosts = true;
      _posts = await _postService.getPosts();
      isLoadingPosts = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      } else {
        postsLoadingError = e.error;
      }
    } catch (e) {
      postsLoadingError = "Something went wrong, please try again";
    }
  }

  get posts => _posts;

  Future<void> getUser() async {
    try {
      _user = await _authService.getUser();
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        postsLoadingError =
            "Something is wrong with the connection to the server";
      }
      print(e);
    } catch (e) {
      print(e);
      postsLoadingError = "Something went wrong, please try again";
    }
  }

  get user => _user;

  Future<void> like(int postId) async {
    try {
      _postService.likePost(postId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {}
    } catch (e) {}
  }

  Future<void> unlike(int postId) async {
    try {
      _postService.unLikePost(postId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {}
    } catch (e) {}
  }

  Future<bool> share(int postId) async {
    try {
      var shared = _postService.sharePost(postId);
      notifyListeners();
      return shared;
    } on ApiClientException catch (e) {
    } catch (e) {}
    return false;
  }
}
