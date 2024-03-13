import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpoint/domain/api_clients/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/post_view_entry/post_view_entry.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel();

  final _userService = UserService();
  final _postService = PostService();
  final postViewEntryTable = PostViewEntryTable();

  User? user;
  User? profile;
  List<Post> posts = [];
  var viewedPosts = <int>[];
  var isLoadingDatabase = true;
  String error = "";
  bool following = false;

  ImagePicker picker = ImagePicker();
  XFile? image;

  bool proceedingFollowing = false;

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
}
