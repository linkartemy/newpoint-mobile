import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/views/theme/theme.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key, required this.profileImageId, this.radius})
      : super(key: key);

  final int profileImageId;
  final int? radius;

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  final _imageService = ImageService();
  List<int> profileImage = [];

  Future<void> loadProfileImage() async {
    profileImage = await _imageService.getImageById(widget.profileImageId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadProfileImage();
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.radius?.toDouble() ?? 36;
    return profileImage.isEmpty
        ? Container(
            padding: EdgeInsets.all(radius / 2),
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ))
        : CircleAvatar(
            radius: radius,
            backgroundImage:
                Image.memory(Uint8List.fromList(profileImage)).image,
          );
  }
}
