import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/comment.dart';
import 'package:newpoint/components/dynamic_sliver_appbar.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/domain/models/comment/comment.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/post/post_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:newpoint/resources/resources.dart';

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
      setState(() {
        _isLoadingPost = false;
      });
    }
  }

  Future<void> onShareTap() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.share();
    setState(() {});
  }

  Future<void> onLikeTap() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.like();
    setState(() {});
  }

  Future<void> onCommentSendTap() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.sendComment();
    await model.getComments();
    setState(() {});
  }

  Future<void> onCommentLikeTap(int index) async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.likeComment(index);
    setState(() {});
  }

  Future<void> onHeaderTap() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await Navigator.of(context).pushNamed(MainNavigationRouteNames.profile,
        arguments: model.post!.authorId);
    setState(() {
      _isLoadingPost = true;
    });
    await onRefresh();
  }

  Future<void> deletePost() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.deletePost();
    Navigator.of(context).pop();
  }

  Future<void> getPost() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.getPost();
    setState(() {});
  }

  Future<void> getUser() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.getUser();
    setState(() {});
  }

  Future<void> getComments() async {
    final model = Provider.of<PostViewModel>(context, listen: false);
    await model.getComments();
    setState(() {
      _isLoadingPost = false;
    });
  }

  Future<void> reload() async {
    setState(() {
      _isLoadingPost = true;
    });
    await getUser();
    await getPost();
    await getComments();
  }

  @override
  void initState() {
    super.initState();
    reload();
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
              Navigator.of(context).pop(model.post);
            },
            child: const Icon(Icons.arrow_back_rounded, size: 25),
          ),
          title: Container(
              alignment: Alignment.centerRight,
              child: Image.asset(
                AppImages.logoTitleOutline,
                width: 100,
              )),
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
                                implyLeading: false,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      InkWell(
                                          onTap: () async {
                                            await onHeaderTap();
                                          },
                                          child: _Header(
                                            login: post.login,
                                            name: post.name,
                                            surname: post.surname,
                                            date: post.creationTimestamp,
                                            profileImageId: post.profileImageId,
                                            deletePost: deletePost,
                                          )),
                                      const SizedBox(height: 16),
                                      _Body(
                                        content: post.content,
                                      ),
                                      const SizedBox(height: 10),
                                      _Footer(
                                        id: post.id,
                                        likes: post.likes,
                                        shares: post.shares,
                                        comments: post.comments,
                                        views: post.views,
                                        liked: post.liked,
                                        onLikeTap: onLikeTap,
                                        onShareTap: onShareTap,
                                        onSendTap: onCommentSendTap,
                                      ),
                                    ]),
                              ),
                            ],
                        body: _Comments(
                            comments: model.comments,
                            onLikeTap: onCommentLikeTap,
                            reload: reload))));
  }
}

class _Header extends StatelessWidget {
  const _Header(
      {Key? key,
      required this.login,
      required this.name,
      required this.surname,
      required this.date,
      required this.profileImageId,
      required this.deletePost})
      : super(key: key);
  final String login;
  final String name;
  final String surname;
  final DateTime date;
  final int profileImageId;
  final Future<void> Function() deletePost;

  Future<void> onDetailsTap(
      int userId, int authorId, BuildContext context) async {
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.start,
      actionsOverflowAlignment: OverflowBarAlignment.center,
      title: Text(
        AppLocalizations.of(context)!.actions,
        textAlign: TextAlign.center,
        style: AdaptiveTheme.of(context).theme.textTheme.titleLarge,
      ),
      actions: [
        userId == authorId
            ? TextButton(
                child: Text(AppLocalizations.of(context)!.deletePost,
                    textAlign: TextAlign.center),
                onPressed: () async {
                  AlertDialog alert = AlertDialog(
                    actionsAlignment: MainAxisAlignment.start,
                    actionsOverflowAlignment: OverflowBarAlignment.center,
                    title: Text(
                      AppLocalizations.of(context)!.areYouSure,
                      textAlign: TextAlign.center,
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.titleLarge,
                    ),
                    actions: [
                      TextButton(
                        child: Text(AppLocalizations.of(context)!.yes,
                            textAlign: TextAlign.center),
                        onPressed: () async {
                          await deletePost();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text(
                          AppLocalizations.of(context)!.cancel,
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
              )
            : SizedBox(),
        TextButton(
          child: Text(
            AppLocalizations.of(context)!.cancel,
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PostViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: ProfileImage(
                  profileImageId: profileImageId,
                )),
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
                                .titleSmall!
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
          onTap: () async {
            await onDetailsTap(model.user!.id, model.post!.authorId, context);
          },
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
        padding: EdgeInsets.symmetric(horizontal: 24),
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
  const _Footer(
      {Key? key,
      required this.id,
      required this.likes,
      required this.shares,
      required this.comments,
      required this.views,
      required this.liked,
      required this.onLikeTap,
      required this.onShareTap,
      required this.onSendTap})
      : super(key: key);
  final int id;
  final int likes;
  final int shares;
  final int comments;
  final int views;
  final bool liked;
  final Future<void> Function() onLikeTap;
  final onShareTap;
  final Future<void> Function() onSendTap;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PostViewModel>(context, listen: false);

    return Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
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
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: onLikeTap,
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
                            ? const Icon(CupertinoIcons.heart_solid,
                                color: AppColors.primary)
                            : const Icon(CupertinoIcons.heart),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text(views.toString(),
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.query_stats,
                      size: 22,
                    ),
                  ]),
                ],
              ),
            ],
          )),
      TextFormField(
        onChanged: model.onCommentTextChanged,
        controller: model.commentFieldText,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelStyle:
              AdaptiveTheme.of(context).theme.inputDecorationTheme.labelStyle,
          labelText: AppLocalizations.of(context)!.yourThoughts,
          isCollapsed:
              AdaptiveTheme.of(context).theme.inputDecorationTheme.isCollapsed,
          fillColor:
              AdaptiveTheme.of(context).theme.inputDecorationTheme.fillColor,
          focusColor:
              AdaptiveTheme.of(context).theme.inputDecorationTheme.focusColor,
          hoverColor:
              AdaptiveTheme.of(context).theme.inputDecorationTheme.hoverColor,
          suffixIcon: InkWell(
              onTap: onSendTap,
              child: const Icon(Icons.send, color: AppColors.primary)),
        ),
        style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
      ),
    ]);
  }
}

class _Comments extends StatefulWidget {
  const _Comments(
      {Key? key,
      required this.comments,
      required this.onLikeTap,
      required this.reload})
      : super(key: key);

  final List<Comment> comments;
  final Future<void> Function(int) onLikeTap;
  final Future<void> Function() reload;

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<_Comments> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PostViewModel>(context, listen: false);

    Future<void> deleteComment(int index) async {
      await model.deleteComment(widget.comments[index].id);
      setState(() {});
    }

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
            itemCount: widget.comments.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var comment = widget.comments[index];

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
                onLikeTap: widget.onLikeTap,
                reload: widget.reload,
                deleteComment: () async {
                  await deleteComment(index);
                },
                canDelete: model.user!.id == widget.comments[index].userId,
              );
            }));
  }
}
