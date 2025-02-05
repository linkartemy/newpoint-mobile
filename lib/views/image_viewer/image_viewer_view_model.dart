import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/exceptions/api_client_exception.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/domain/services/user_service.dart';

class ImageViewerViewModel extends ChangeNotifier {
  ImageViewerViewModel(this.imageId);

  final _userService = UserService();
  final _imageService = ImageService();

  late int imageId;
  User? user;
  String error = "";

  late Uint8List imageData;

  Future<void> getUser() async {
    try {
      user = await _userService.getUser();
      imageData = (await _imageService.getImageById(imageId)) as Uint8List;
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
