import 'package:flutter/material.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
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

  Future<void> createPost() async {
    try {
      textFieldError = "";
      final postText = textFieldController.text;
      if (postText.isEmpty) {
        textFieldError = "Post content mustn't be empty";
        return;
      }
      if (postText.length > 255) {
        textFieldError = "Post content length mustn't be more than 255 characters";
        return;
      }
      await _postService.addPost(user!.id, postText, []);
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
