import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/article_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class ArticleCreatorViewModel extends ChangeNotifier {
  ArticleCreatorViewModel();

  final _userService = UserService();
  final _articleService = ArticleService();

  User? user;
  String error = "";
  String textFieldError = "";
  final titleFieldController = TextEditingController();
  final textFieldController = TextEditingController();
  String inputText = "";
  final scrollController = ScrollController();

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

  Future<void> createArticle() async {
    try {
      textFieldError = "";
      final title = titleFieldController.text;
      final text = textFieldController.text;
      if (title.isEmpty) {
        setTextFieldError("Article title can't be empty");
        return;
      }
      if (text.isEmpty) {
        setTextFieldError("Article content can't be empty");
        return;
      }
      if (text.length > 10000) {
        setTextFieldError("Article content can't be longer than 10000 characters");
        return;
      }
      await _articleService.addArticle(user!.id, title, text, []);
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
