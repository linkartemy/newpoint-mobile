import 'package:flutter/material.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class AccountSettingsMenuViewModel extends ChangeNotifier {
  AccountSettingsMenuViewModel();

  final _userService = UserService();
  final _postService = PostService();
  final postViewEntryTable = PostViewEntryTable();

  User? user;
  String error = "";

  TextEditingController settingsNameFieldText = TextEditingController();

  Future<void> getUser() async {
    try {
      user = await _userService.getUser();
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
      error = e.error;
    } catch (e) {
      error = "Something went wrong, please try again";
    }
  }
}
