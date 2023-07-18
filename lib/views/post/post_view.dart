import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:newpoint/components/drawer.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/domain/models/post.dart';
import 'package:newpoint/domain/models/post_date_parser.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/post/post_view_model.dart';
import 'package:newpoint/views/theme/app_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  PostViewState createState() => PostViewState();
}

class PostViewState extends State<PostView> {
  User? user;
  Post? post;
  bool _isLoadingPost = false;

  Future<void> getPost() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.getPost();
    setState(() {
      post = model.post;
      _isLoadingPost = false;
    });
  }

  Future<void> getUser() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.getUser();
    setState(() {
      user = model.user;
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
    setState(() {
      _isLoadingPost = true;
    });
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_rounded, size: 25),
          ),
          title: const Text(""),
        ),
        body: _PostView(
          isLoading: _isLoadingPost,
        ));
  }
}

class _PostView extends StatefulWidget {
  const _PostView({Key? key, required this.isLoading}) : super(key: key);
  final bool isLoading;
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<_PostView> {
  @override
  Widget build(BuildContext context) {
    Future<void> onRefresh() async {
      final model = Provider.of<PostViewModel>(context, listen: false);
      await model.getUser();
      await model.getPost();
    }

    Future<void> onHeaderTap(BuildContext context) async {
      final model = Provider.of<PostViewModel>(context, listen: false);
      Navigator.of(context).pushNamed(MainNavigationRouteNames.profile,
          arguments: model.post!.authorId);
    }

    final model = Provider.of<PostViewModel>(context);
    if (model.error.isNotEmpty) {
      return RefreshIndicator(
          onRefresh: onRefresh,
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 0;
          },
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(model.error,
                  style:
                      AdaptiveTheme.of(context).theme.textTheme.bodyMedium)));
    } else {
      var post = model.post;
      return widget.isLoading || post == null
          ? const LoaderView()
          : RefreshIndicator(
              onRefresh: onRefresh,
              notificationPredicate: (ScrollNotification notification) {
                return notification.depth == 0;
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    InkWell(
                        onTap: () async {
                          await onHeaderTap(context);
                        },
                        child: _Header(
                          name: model.post!.name,
                          surname: model.post!.surname,
                          date: model.post!.creationTimestamp,
                        )),
                    const SizedBox(height: 10),
                    _Body(
                      content: model.post!.content,
                    ),
                    const SizedBox(height: 5),
                    _Footer(
                      id: model.postId,
                      likes: model.post!.likes,
                      shares: model.post!.shares,
                      comments: model.post!.comments,
                    )
                  ],
                ),
              ));
    }
  }
}

class _Header extends StatelessWidget {
  const _Header(
      {Key? key, required this.name, required this.surname, required this.date})
      : super(key: key);
  final String name;
  final String surname;
  final DateTime date;

  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: const Icon(Icons.ice_skating)),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$name $surname",
                  style: AdaptiveTheme.of(context).theme.textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(convertPostDateToString(date)!,
                    style: AdaptiveTheme.of(context).theme.textTheme.titleSmall)
              ],
            )
          ],
        ),
        InkWell(
          onTap: onDetailsTap,
          child: const SizedBox(
            height: 30,
            width: 30,
            child: Icon(
              Icons.more_vert,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key, required this.content}) : super(key: key);
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Text(content,
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyLarge)
              ],
            ))
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer(
      {Key? key,
      required this.id,
      required this.likes,
      required this.shares,
      required this.comments})
      : super(key: key);
  final int id;
  final int likes;
  final int shares;
  final int comments;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              Text("${comments.toString()} comments",
                  style: AdaptiveTheme.of(context).theme.textTheme.titleMedium),
            ],
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(shares.toString(),
                    style:
                        AdaptiveTheme.of(context).theme.textTheme.titleMedium),
                const SizedBox(
                  width: 5,
                ),
                const Icon(CupertinoIcons.share),
              ],
            ),
            Row(
              children: [
                Text(likes.toString(),
                    style:
                        AdaptiveTheme.of(context).theme.textTheme.titleMedium),
                const SizedBox(
                  width: 5,
                ),
                const Icon(CupertinoIcons.heart),
              ],
            )
          ],
        )
      ],
    );
  }
}
