import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/comment.dart';
import 'package:newpoint/components/dynamic_sliver_appbar.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/domain/models/date_parser.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/post/post_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  PostViewState createState() => PostViewState();
}

class PostViewState extends State<PostView> {
  bool _isLoadingPost = false;

  Future<void> onRefresh() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.getUser();
    await model.getPost();
    await model.getComments();
    if (model.post != null) {
      setState(() {});
    }
  }

  Future<void> onShareTap(BuildContext context) async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.share();
    setState(() {});
  }

  Future<void> onLikeTap(BuildContext context) async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.like();
    setState(() {});
  }

  Future<void> onCommentSendTap(BuildContext context) async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.sendComment();
    await model.getComments();
    setState(() {});
  }

  Future<void> onCommentLikeTap(BuildContext context, int index) async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.likeComment(index);
    setState(() {});
  }

  Future<void> onHeaderTap(BuildContext context) async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    Navigator.of(context).pushNamed(MainNavigationRouteNames.profile,
        arguments: model.post!.authorId);
  }

  Future<void> getPost() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.getPost();
    setState(() {
      _isLoadingPost = false;
    });
  }

  Future<void> getUser() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.getUser();
    setState(() {});
  }

  Future<void> getComments() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.getComments();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUser();
    setState(() {
      _isLoadingPost = true;
    });
    getPost();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PostViewModel>(context);
    var post = model.post;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_rounded, size: 25),
          ),
          title: const Text(""),
        ),
        body: RefreshIndicator(
            onRefresh: onRefresh,
            notificationPredicate: (ScrollNotification notification) {
              if (model.error.isNotEmpty || _isLoadingPost || post == null) {
                return notification.depth == 0;
              }
              return notification.depth == 1;
            },
            child: model.error.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Text(model.error,
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .bodyMedium))
                : _isLoadingPost || post == null
                    ? const LoaderView()
                    : NestedScrollView(
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [
                              DynamicSliverAppBar(
                                forceElevated: innerBoxIsScrolled,
                                maxHeight: 300,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            await onHeaderTap(context);
                                          },
                                          child: _Header(
                                            login: post.login,
                                            name: post.name,
                                            surname: post.surname,
                                            date: post.creationTimestamp,
                                          )),
                                      const SizedBox(height: 10),
                                      _Body(
                                        content: post.content,
                                      ),
                                      const SizedBox(height: 5),
                                      _Footer(
                                        id: post.id,
                                        likes: post.likes,
                                        shares: post.shares,
                                        comments: post.comments,
                                        liked: post.liked,
                                        onLikeTap: onLikeTap,
                                        onShareTap: onShareTap,
                                      ),
                                    ]),
                              ),
                            ],
                        body: _Comments(
                          comments: model.comments,
                          onSendTap: onCommentSendTap,
                          onLikeTap: onCommentLikeTap,
                        ))));
  }
}

class _Header extends StatelessWidget {
  const _Header(
      {Key? key,
      required this.login,
      required this.name,
      required this.surname,
      required this.date})
      : super(key: key);
  final String login;
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
                RichText(
                  text: TextSpan(
                      text: "$name $surname ",
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: "@$login",
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: CupertinoColors.secondaryLabel))
                      ]),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(AppLocalizations.of(context)!.postDateTime(date, date),
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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text(content,
                        style:
                            AdaptiveTheme.of(context).theme.textTheme.bodyLarge)
                  ],
                ))
          ],
        ));
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
    required this.id,
    required this.likes,
    required this.shares,
    required this.comments,
    required this.liked,
    required this.onLikeTap,
    required this.onShareTap,
  }) : super(key: key);
  final int id;
  final int likes;
  final int shares;
  final int comments;
  final bool liked;
  final onLikeTap;
  final onShareTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Text(AppLocalizations.of(context)!.nComments(comments),
                      style: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .titleMedium),
                ],
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {
                    await onShareTap(context);
                  },
                  child: Row(
                    children: [
                      Text(shares.toString(),
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleMedium),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(CupertinoIcons.share),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () async {
                    await onLikeTap(context);
                  },
                  child: Row(
                    children: [
                      Text(likes.toString(),
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleMedium),
                      const SizedBox(
                        width: 5,
                      ),
                      liked
                          ? const Icon(CupertinoIcons.heart_solid)
                          : const Icon(CupertinoIcons.heart),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class _Comments extends StatelessWidget {
  const _Comments({
    Key? key,
    required this.comments,
    required this.onLikeTap,
    required this.onSendTap,
  }) : super(key: key);
  final List<Comment> comments;
  final onSendTap;
  final onLikeTap;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PostViewModel>(context, listen: false);

    return Column(children: [
      TextFormField(
        onChanged: model.onCommentTextChanged,
        controller: model.commentFieldText,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'Your thoughts?',
          suffixIcon: InkWell(
              onTap: () async {
                await onSendTap(
                  context,
                );
              },
              child: const Icon(Icons.send)),
        ),
        style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
      ),
      ListView.builder(
          itemCount: comments.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var comment = comments[index];

            return CommentComponent(
                index: index,
                id: comment.id,
                userId: comment.userId,
                login: comment.login,
                name: comment.name,
                surname: comment.surname,
                date: comment.creationTimestamp,
                content: comment.content,
                likes: comment.likes,
                liked: comment.liked,
                onLikeTap: onLikeTap);
          })
    ]);
  }
}
