import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:newpoint/components/comment.dart';
import 'package:newpoint/components/dynamic_sliver_appbar.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/components/refresh_indicator.dart';
import 'package:newpoint/components/simple_markdown_editor/widgets/markdown_body.dart';
import 'package:newpoint/domain/models/article_comment/article_comment.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/resources/resources.dart';
import 'package:newpoint/views/article/article_view_model.dart';
import 'package:newpoint/views/image_viewer/image_viewer_view_model.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:photo_view/photo_view.dart';

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
