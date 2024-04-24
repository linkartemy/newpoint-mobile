import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/components/simple_markdown_editor/widgets/markdown_body.dart';
import 'package:newpoint/domain/models/date_parser.dart';
import 'package:newpoint/views/theme/theme.dart';

class ArticleComponent extends StatelessWidget {
  const ArticleComponent(
      {Key? key,
      required this.id,
      required this.login,
      required this.name,
      required this.surname,
      required this.profileImageId,
      required this.date,
      required this.title,
      required this.content,
      required this.images,
      required this.likes,
      required this.liked,
      required this.bookmarked,
      required this.shares,
      required this.comments,
      required this.views,
      required this.onShareTap,
      required this.onLikeTap,
      required this.onBookmarkTap,
      required this.onTap,
      required this.canDelete,
      required this.deletePost,
      required this.canAddToBlacklist,
      required this.addToBlacklist})
      : super(key: key);
  final int id;
  final String login;
  final String name;
  final String surname;
  final int profileImageId;
  final DateTime date;
  final String title;
  final String content;
  final List<Image> images;
  final int likes;
  final bool liked;
  final bool bookmarked;
  final int shares;
  final int comments;
  final int views;
  final Future<void> Function(BuildContext context) onShareTap;
  final Future<void> Function(BuildContext context) onLikeTap;
  final Future<void> Function() onBookmarkTap;
  final Future<void> Function(BuildContext context) onTap;
  final bool canDelete;
  final Future<void> Function() deletePost;
  final bool canAddToBlacklist;
  final Future<void> Function() addToBlacklist;

  Future<void> onDetailsTap(BuildContext context) async {
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.start,
      actionsOverflowAlignment: OverflowBarAlignment.center,
      title: Text(
        AppLocalizations.of(context)!.actions,
        textAlign: TextAlign.center,
        style: AdaptiveTheme.of(context).theme.textTheme.titleLarge,
      ),
      actions: [
        TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await onBookmarkTap();
            },
            child: bookmarked
                ? Text(AppLocalizations.of(context)!.removeFromBookmarks,
                    textAlign: TextAlign.center)
                : Text(AppLocalizations.of(context)!.addToBookmarks,
                    textAlign: TextAlign.center)),
        canDelete
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
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          await deletePost();
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
            : const SizedBox(),
        canAddToBlacklist
            ? TextButton(
                child: Text(
                  AppLocalizations.of(context)!.addToBlacklist,
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
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
                          await addToBlacklist();
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
            : const SizedBox(),
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
    return InkWell(
        onTap: () async {
          await onTap(context);
        },
        onLongPress: () async {
          await onDetailsTap(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(
              login: login,
              name: name,
              surname: surname,
              profileImageId: profileImageId,
              date: date,
              onDetailsTap: onDetailsTap,
              deletePost: deletePost,
              canDelete: canDelete,
            ),
            const SizedBox(height: 10),
            _Body(
              title: title,
              content: content,
              onTap: onTap,
            ),
            _Footer(
                id: id,
                likes: likes,
                shares: shares,
                comments: comments,
                views: views,
                liked: liked,
                bookmarked: bookmarked,
                onLikeTap: onLikeTap,
                onShareTap: onShareTap,
                onBookmarkTap: onBookmarkTap)
          ],
        ));
  }
}

class _Header extends StatelessWidget {
  const _Header(
      {Key? key,
      required this.login,
      required this.name,
      required this.surname,
      required this.profileImageId,
      required this.date,
      required this.onDetailsTap,
      required this.deletePost,
      required this.canDelete})
      : super(key: key);
  final String login;
  final String name;
  final String surname;
  final int profileImageId;
  final DateTime date;
  final Future<void> Function(BuildContext) onDetailsTap;
  final Future<void> Function() deletePost;
  final bool canDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
            child: ProfileImage(
              profileImageId: profileImageId,
            )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: RichText(
                    text: TextSpan(
                        text: "$name $surname ",
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium,
                        children: [
                      TextSpan(
                          text: "@$login",
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: AdaptiveTheme.of(context)
                                      .theme
                                      .colorScheme
                                      .secondary)),
                    ])),
              ),
              InkWell(
                onTap: () async {
                  await onDetailsTap(context);
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
            ]),
            const SizedBox(
              height: 2,
            ),
            Text(dateToAgoString(context, date),
                style: AdaptiveTheme.of(context)
                    .theme
                    .textTheme
                    .bodyMedium!
                    .copyWith(
                        color: AdaptiveTheme.of(context)
                            .theme
                            .colorScheme
                            .secondary))
          ],
        )),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body(
      {Key? key,
      required this.title,
      required this.content,
      required this.onTap})
      : super(key: key);
  final String title;
  final String content;
  final Future<void> Function(BuildContext) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: AdaptiveTheme.of(context).theme.textTheme.titleLarge),
            const SizedBox(
              height: 10,
            ),
            ClipRect(
                child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                  stops: [0.8, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                ),
                child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: InkWell(
                        onTap: () async {
                          await onTap(context);
                        },
                        child: MarkdownBodyComponent(
                          content: content,
                        ))),
              ),
            )),
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
    required this.views,
    required this.liked,
    required this.bookmarked,
    required this.onLikeTap,
    required this.onShareTap,
    required this.onBookmarkTap,
  }) : super(key: key);

  final int id;
  final int likes;
  final int shares;
  final int comments;
  final int views;
  final bool liked;
  final bool bookmarked;
  final onLikeTap;
  final onShareTap;
  final Future<void> Function() onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            fit: FlexFit.loose,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppLocalizations.of(context)!.nCompact(comments),
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.titleSmall),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.mode_comment,
                    size: 16,
                  ),
                ])),
        Flexible(
            fit: FlexFit.tight,
            child: InkWell(
              onTap: () async {
                await onShareTap(context);
              },
              child: SizedBox(
                  height: 46,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppLocalizations.of(context)!.nCompact(shares),
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleSmall),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        CupertinoIcons.share,
                        size: 16,
                      ),
                    ],
                  )),
            )),
        Flexible(
            fit: FlexFit.tight,
            child: InkWell(
              onTap: () async {
                await onLikeTap(context);
              },
              child: SizedBox(
                  height: 46,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(AppLocalizations.of(context)!.nCompact(likes),
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleSmall),
                      const SizedBox(
                        width: 5,
                      ),
                      liked
                          ? const Icon(CupertinoIcons.heart_solid,
                              size: 16, color: AppColors.primary)
                          : const Icon(
                              CupertinoIcons.heart,
                              size: 16,
                            ),
                    ],
                  )),
            )),
        Flexible(
            fit: FlexFit.loose,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(AppLocalizations.of(context)!.nCompact(views),
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.titleSmall),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.query_stats,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ])),
      ],
    );
  }
}
