import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/domain/services/comment_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class PostViewModel extends ChangeNotifier {
  PostViewModel(this.postId);

  final _userService = UserService();
  final _postService = PostService();
  final _commentService = CommentService();

  late int postId;
  User? user;
  Post? post;
  List<Comment> comments = [];
  String error = "";
  final commentFieldText = TextEditingController();
  String comment = "";

  bool proceedingLikePost = false;
  bool proceedingLikeComment = false;

  void onCommentTextChanged(String value) {
    comment = value;
  }

  Future<void> getUser() async {
    try {
      user = await _userService.getUser();
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
      post = await _postService.getPostById(postId);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }

  Future<void> deletePost() async {
    try {
      await _postService.deletePost(postId);
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
      comments = await _commentService.getCommentsByPostId(postId);
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
      _postService.sharePost(postId);
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
      if (proceedingLikePost) {
        return;
      }
      proceedingLikePost = true;
      post!.liked = !post!.liked;
      if (!post!.liked) {
        await _postService.unLikePost(postId);
        post!.likes--;
      } else {
        await _postService.likePost(postId);
        post!.likes++;
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    proceedingLikePost = false;
  }

  Future<void> sendComment() async {
    try {
      await _commentService.addComment(postId, comment);
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

  Future<void> deleteComment(int commentId) async {
    try {
      await _commentService.deleteComment(commentId);
      comments.removeWhere((element) => element.id == commentId);
      --post!.comments;
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
      if (proceedingLikeComment) {
        return;
      }
      proceedingLikeComment = true;
      final comment = comments[index];
      comment.liked = !comment.liked;
      if (!comment.liked) {
        await _commentService.unLikeComment(comment.id);
        comment.likes--;
      } else {
        await _commentService.likeComment(comment.id);
        comment.likes++;
      }
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    proceedingLikeComment = false;
  }
}
