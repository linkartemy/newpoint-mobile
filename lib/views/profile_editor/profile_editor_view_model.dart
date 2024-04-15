import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newpoint/domain/data_providers/database/post_view_table.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/post_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class ProfileEditorViewModel extends ChangeNotifier {
  ProfileEditorViewModel(this.profileId);

  final _userService = UserService();
  final _postService = PostService();
  final postViewEntryTable = PostViewEntryTable();

  final nameTextController = TextEditingController();
  final surnameTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  final locationTextController = TextEditingController();
  final birthDateController = TextEditingController();

  var birthDate = DateTime.now();

  late int profileId;
  User? user;
  User? profile;
  List<Post> posts = [];
  var viewedPosts = <int>[];
  var isLoadingDatabase = true;
  String error = "";

  ImagePicker picker = ImagePicker();
  XFile? image;

  void setError(String message) {
    error = message;
    notifyListeners();
    Future.delayed(const Duration(milliseconds: 5000), () {
      error = "";
      notifyListeners();
    });
  }

  Future<void> onImageTap() async {
    try {
      image = await picker.pickImage(source: ImageSource.gallery);
      notifyListeners();
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
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

  Future<void> setBirthDate(BuildContext context, DateTime birthDate) async {
    birthDateController.text =
        AppLocalizations.of(context)!.birthDate(birthDate);
  }

  Future<void> getProfile() async {
    try {
      profile = await _userService.getProfileById(profileId);
      if (profile != null) {
        nameTextController.text = profile!.name;
        surnameTextController.text = profile!.surname;
        descriptionTextController.text = profile!.description ?? "";
        locationTextController.text = profile!.location ?? "";
      }
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

  Future<bool> updateProfile() async {
    try {
      final name = nameTextController.text;
      final surname = surnameTextController.text;
      final description = descriptionTextController.text;
      final location = locationTextController.text;
      if (name == profile!.name &&
          surname == profile!.surname &&
          description == profile!.description &&
          location == profile!.location) {
        return true;
      }
      if (name.isEmpty || surname.isEmpty) {
        setError("Name or surname can't be empty");
        return false;
      }
      profile = await _userService.updateProfile(
          name, surname, description, location, birthDate);
      notifyListeners();
      return true;
    } on ApiClientException catch (e) {
      if (e.type == ApiClientExceptionType.network) {
        error = "Something is wrong with the connection to the server";
      } else {
        error = e.error;
      }
    } catch (e) {
      error = "Something went wrong, please try again";
    }
    return false;
  }
}
