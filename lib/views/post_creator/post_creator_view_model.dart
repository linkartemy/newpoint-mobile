import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class PostCreatorViewModel extends ChangeNotifier {
  PostCreatorViewModel();

  final _userService = UserService();
  final _postService = PostService();

  User? user;
  String error = "";
  String textFieldError = "";
  final textFieldController = TextEditingController();

  void setTextFieldError(String message) {
    textFieldError = message;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 5000), () {
      textFieldError = "";
      notifyListeners();
    });
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

  Future<int> createPost() async {
    try {
      textFieldError = "";
      final postText = textFieldController.text;
      if (postText.isEmpty) {
        setTextFieldError("Post content can't be empty");
        return -1;
      }
      if (postText.length > 255) {
        setTextFieldError("Post content can't be longer than 255 characters");
        return -1;
      }
      return await _postService.addPost(user!.id, postText, []);
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    return -1;
  }
}
