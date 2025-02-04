import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/views/image_viewer/image_viewer_view_model.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class ImageViewerView extends StatefulWidget {
  const ImageViewerView({Key? key}) : super(key: key);

  @override
  ImageViewerViewState createState() => ImageViewerViewState();
}

class ImageViewerViewState extends State<ImageViewerView> {
  var _isLoading = false;

  Future<void> getUser() async {
    final model = Provider.of<ImageViewerViewModel>(context, listen: false);
    await model.getUser();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ImageViewerViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_rounded, size: 25),
          ),
        ),
        body: model.error.isNotEmpty
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(model.error,
                    style:
                        AdaptiveTheme.of(context).theme.textTheme.bodyMedium))
            : _isLoading
                ? const LoaderView()
                : const _Image());
  }
}

class _Image extends StatelessWidget {
  const _Image({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ImageViewerViewModel>(context, listen: false);

    return PhotoView(
      imageProvider: Image.memory(model.imageData).image,
    );
  }
}
