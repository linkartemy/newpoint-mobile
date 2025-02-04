import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:newpoint/domain/services/image_service.dart';
import 'package:newpoint/views/theme/theme.dart';

class ProfileImage extends StatefulWidget {
  ProfileImage({Key? key, required this.profileImageId, this.radius})
      : super(key: key);

  final int profileImageId;
  final int? radius;

  @override
  _ProfileImageState createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage>
    with AutomaticKeepAliveClientMixin {
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
  void didUpdateWidget(ProfileImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profileImageId != widget.profileImageId) {
      loadProfileImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final r = widget.radius?.toDouble() ?? 32;
    return profileImage.isEmpty
        ? Container(
            padding: EdgeInsets.all(r / 2),
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ))
        : ClipOval(
            child: SizedBox.fromSize(
                size: Size.fromRadius(r),
                child: Image.memory(
                  Uint8List.fromList(profileImage),
                  gaplessPlayback: true,
                  fit: BoxFit.cover,
                  width: r,
                  height: r,
                )));
  }

  @override
  bool get wantKeepAlive => true;
}
