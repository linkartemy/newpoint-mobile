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
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  ArticleViewState createState() => ArticleViewState();
}

class ArticleViewState extends State<ArticleView> {
  bool _isLoadingPost = false;
  final scrollController = ScrollController();

  Future<void> onRefresh() async {
    final model = Provider.of<ArticleViewModel>(context, listen: false);
    await model.getUser();
    await model.getArticle();
    await model.getComments();
    if (model.article != null) {
      setState(() {
        _isLoadingPost = false;
      });
    }
  }

  Future<void> onCommentLikeTap(int index) async {
    final model = Provider.of<ArticleViewModel>(context, listen: false);
    await model.likeComment(index);
    setState(() {});
  }

  Future<void> onHeaderTap() async {
    final model = Provider.of<ArticleViewModel>(context, listen: false);
    await Navigator.of(context).pushNamed(MainNavigationRouteNames.profile,
        arguments: model.article!.authorId);
    setState(() {
      _isLoadingPost = true;
    });
    await onRefresh();
  }

  Future<void> getArticle() async {
    final model = Provider.of<ArticleViewModel>(context, listen: false);
    await model.getArticle();
    setState(() {});
  }

  Future<void> getUser() async {
    final model = Provider.of<ArticleViewModel>(context, listen: false);
    await model.getUser();
    setState(() {});
  }

  Future<void> getComments() async {
    final model = Provider.of<ArticleViewModel>(context, listen: false);
    await model.getComments();
    setState(() {
      _isLoadingPost = false;
    });
  }

  Future<void> loadComments() async {
    final model = Provider.of<ArticleViewModel>(context, listen: false);
    await model.loadComments();
    setState(() {});
  }

  Future<void> reloadComments() async {
    final model = Provider.of<ArticleViewModel>(context, listen: false);
    await model.reloadComments();
    setState(() {});
  }

  Future<void> reload() async {
    await getUser();
    await getArticle();
    await reloadComments();
  }

  @override
  void initState() {
    super.initState();
    getUser();
    getArticle();
    getComments();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ArticleViewModel>(context);
    var article = model.article;

    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(model.article);
            },
            child: const Icon(Icons.arrow_back_rounded, size: 25),
          ),
        ),
        body: RefreshIndicatorComponent(
            onRefresh: onRefresh,
            notificationPredicate: (ScrollNotification notification) {
              if (scrollController.hasClients) {
                return scrollController.position.pixels == 0;
              }
              return false;
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
                : _isLoadingPost || article == null
                    ? const LoaderView()
                    : model.comments.isEmpty
                        ? SingleChildScrollView(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    await onHeaderTap();
                                  },
                                  child: const _Header()),
                              const SizedBox(height: 16),
                              const _Body(),
                              const _Footer(),
                            ],
                          ))
                        : NestedScrollView(
                            controller: scrollController,
                            physics: const NeverScrollableScrollPhysics(),
                            headerSliverBuilder:
                                (context, innerBoxIsScrolled) => [
                                      DynamicSliverAppBar(
                                        forceElevated: innerBoxIsScrolled,
                                        maxHeight: 10000,
                                        implyLeading: false,
                                        collapseMode: CollapseMode.pin,
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              InkWell(
                                                  onTap: () async {
                                                    await onHeaderTap();
                                                  },
                                                  child: const _Header()),
                                              const SizedBox(height: 16),
                                              const _Body(),
                                              const _Footer(),
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
  const _Header({
    Key? key,
  }) : super(key: key);

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
                child: Text(AppLocalizations.of(context)!.deleteArticle,
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
                          final model = Provider.of<ArticleViewModel>(context,
                              listen: false);
                          await model.deletePost();
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
            : TextButton(
                child: Text(AppLocalizations.of(context)!.addToBlacklist,
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
                          final model = Provider.of<ArticleViewModel>(context,
                              listen: false);
                          await model.addToBlacklist();
                          Navigator.of(context).pop();
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
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ArticleViewModel>(context);
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 22),
            child: ProfileImage(
              profileImageId: model.article!.profileImageId,
            )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: RichText(
                text: TextSpan(
                    text: "${model.article!.name} ${model.article!.surname} ",
                    style:
                        AdaptiveTheme.of(context).theme.textTheme.titleMedium,
                    children: [
                      TextSpan(
                          text: "@${model.article!.login}",
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: AdaptiveTheme.of(context)
                                      .theme
                                      .colorScheme
                                      .secondary))
                    ]),
              )),
              InkWell(
                onTap: () async {
                  await onDetailsTap(
                      model.user!.id, model.article!.authorId, context);
                },
                child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
                    Icons.more_vert,
                    size: 25,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ]),
            const SizedBox(
              height: 2,
            ),
            Text(
                AppLocalizations.of(context)!.postDateTime(
                    model.article!.creationTimestamp,
                    model.article!.creationTimestamp),
                style: AdaptiveTheme.of(context).theme.textTheme.titleSmall)
          ],
        ))
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ArticleViewModel>(context, listen: false);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model.article!.title,
                style: AdaptiveTheme.of(context).theme.textTheme.titleLarge),
            const SizedBox(height: 10),
            MarkdownBodyComponent(content: model.article!.content),
          ],
        ));
  }
}

class _Footer extends StatefulWidget {
  const _Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<_Footer> {
  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ArticleViewModel>(context, listen: true);

    Future<void> onShareTap() async {
      await model.share();
      setState(() {});
    }

    Future<void> onLikeTap() async {
      await model.like();
      setState(() {});
    }

    Future<void> onCommentSendTap() async {
      final comment = model.commentFieldText.text;
      if (comment.isEmpty || comment.length > 255) {
        return;
      }
      await model.sendComment();
      await model.getComments();
      setState(() {});
    }

    void onCommentTextChanged(String value) {
      model.comment = value;
      setState(() {});
    }

    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: InkWell(
            onTap: onShareTap,
            child: SizedBox(
                height: 46,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        AppLocalizations.of(context)!
                            .nDecimalPattern(model.article!.shares),
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .bodyMedium),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(CupertinoIcons.share, size: 22),
                  ],
                )),
          )),
          Expanded(
              child: InkWell(
            onTap: onLikeTap,
            child: SizedBox(
                height: 46,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        AppLocalizations.of(context)!
                            .nDecimalPattern(model.article!.likes),
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .bodyMedium),
                    const SizedBox(
                      width: 5,
                    ),
                    model.article!.liked
                        ? const Icon(CupertinoIcons.heart_solid,
                            color: AppColors.primary, size: 22)
                        : const Icon(CupertinoIcons.heart, size: 22),
                  ],
                )),
          )),
          Expanded(
              child: SizedBox(
                  height: 46,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            AppLocalizations.of(context)!
                                .nDecimalPattern(model.article!.views),
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .bodyMedium),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.query_stats,
                          size: 22,
                        ),
                      ]))),
          Expanded(
              child: InkWell(
                  onTap: () async {
                    await model.bookmark();
                    setState(() {});
                  },
                  child: SizedBox(
                      height: 46,
                      child: Icon(
                        model.article!.bookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        size: 22,
                      )))),
        ],
      ),
      TextFormField(
        onChanged: onCommentTextChanged,
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
              onTap: onCommentSendTap,
              child: const Icon(Icons.send, color: AppColors.primary)),
        ),
        style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                AppLocalizations.of(context)!
                    .nComments(model.article!.comments),
                style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium),
            Text("${model.commentFieldText.text.length}/255",
                style: AdaptiveTheme.of(context)
                    .theme
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        color: model.commentFieldText.text.length > 255
                            ? AppColors.errorColor
                            : AdaptiveTheme.of(context)
                                .theme
                                .colorScheme
                                .secondary))
          ],
        ),
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

  final List<ArticleComment> comments;
  final Future<void> Function(int) onLikeTap;
  final Future<void> Function() reload;

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<_Comments> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ArticleViewModel>(context, listen: true);

    Future<void> deleteComment(int index) async {
      await model.deleteComment(widget.comments[index].id);
      setState(() {});
    }

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView.builder(
            key: const PageStorageKey("psk1"),
            itemCount: widget.comments.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var comment = widget.comments[index];

              return VisibilityDetector(
                  key: Key('commentkey$index'),
                  onVisibilityChanged: (visibilityInfo) async {
                    if (visibilityInfo.visibleFraction < 0.9 ||
                        widget.comments.length < 5) {
                      return;
                    }
                    if (index == widget.comments.length - 1) {
                      await model.loadComments();
                      setState(() {});
                    }
                  },
                  child: CommentComponent(
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
                  ));
            }));
  }
}
