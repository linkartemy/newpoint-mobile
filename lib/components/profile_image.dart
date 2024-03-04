import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/resources/resources.dart';

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
    return CircleAvatar(
      radius: widget.radius?.toDouble() ?? 36,
      backgroundImage: profileImage.isEmpty
          ? Image.asset(AppImages.logoTitle).image
          : Image.memory(Uint8List.fromList(profileImage)).image,
    );
  }
}
