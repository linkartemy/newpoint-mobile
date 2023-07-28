import 'package:flutter/material.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/domain/models/post.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/domain/services/comment_service.dart';
import 'package:newpoint/domain/services/post_service.dart';

class PostViewModel extends ChangeNotifier {
  PostViewModel(this.postId);

  final _authService = AuthService();
  final _postService = PostService();
  final _commentService = CommentService();

  late int postId;
  User? user;
  Post? post;
  List<Comment> comments = [];
  String error = "";
  final commentFieldText = TextEditingController();
  String comment = "";

  void onCommentTextChanged(String value) {
    comment = value;
  }

  Future<void> getUser() async {
    try {
      user = await _authService.getUser();
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> getPost() async {
    try {
      post = await _postService.getPost(postId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> getComments() async {
    try {
      comments = await _commentService.get(postId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> share() async {
    try {
      _postService.share(postId);
      post!.shares++;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> like() async {
    try {
      if (post!.liked) {
        _postService.unlike(postId);
        post!.likes--;
      } else {
        _postService.like(postId);
        post!.likes++;
      }
      post!.liked = !post!.liked;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> sendComment() async {
    try {
      await _commentService.add(postId, comment);
      comment = "";
      commentFieldText.clear();
      post!.comments++;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> likeComment(int index) async {
    try {
      final comment = comments[index];
      if (comment.liked) {
        _commentService.unlike(comment.id);
        comment.likes--;
      } else {
        _commentService.like(comment.id);
        comment.likes++;
      }
      comment.liked = !comment.liked;
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }
}
