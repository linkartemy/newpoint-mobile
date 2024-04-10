import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/code_service.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class LanguageSettingsViewModel extends ChangeNotifier {
  LanguageSettingsViewModel();

  final _userService = UserService();
  final _postService = PostService();
  final _codeService = CodeService();
  final postViewEntryTable = PostViewEntryTable();

  User? user;
  String error = "";

  void setError(String message) {
    error = message;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 5000), () {
      error = "";
      notifyListeners();
    });
  }

  Future<void> getUser() async {
    try {
      user = await _userService.getUser();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      error = e.error;
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    notifyListeners();
  }
}
