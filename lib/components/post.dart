import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/domain/models/date_parser.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PostComponent extends StatelessWidget {
  const PostComponent(
      {Key? key,
      required this.id,
      required this.login,
      required this.name,
      required this.surname,
      required this.profileImageId,
      required this.date,
      required this.content,
      required this.images,
      required this.likes,
      required this.liked,
      required this.shares,
      required this.comments,
      required this.views,
      required this.onShareTap,
      required this.onLikeTap,
      required this.onTap,
      required this.canDelete,
      required this.deletePost})
      : super(key: key);
  final int id;
  final String login;
  final String name;
  final String surname;
  final int profileImageId;
  final DateTime date;
  final String content;
  final List<Image> images;
  final int likes;
  final bool liked;
  final int shares;
  final int comments;
  final int views;
  final Future<void> Function(BuildContext context) onShareTap;
  final Future<void> Function(BuildContext context) onLikeTap;
  final Future<void> Function(BuildContext context) onTap;
  final bool canDelete;
  final Future<void> Function() deletePost;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          await onTap(context);
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
              deletePost: deletePost,
              canDelete: canDelete,
            ),
            const SizedBox(height: 10),
            _Body(
              content: content,
            ),
            const SizedBox(height: 16),
            _Footer(
              id: id,
              likes: likes,
              shares: shares,
              comments: comments,
              views: views,
              liked: liked,
              onLikeTap: onLikeTap,
              onShareTap: onShareTap,
            )
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
      required this.deletePost,
      required this.canDelete})
      : super(key: key);
  final String login;
  final String name;
  final String surname;
  final int profileImageId;
  final DateTime date;
  final Future<void> Function() deletePost;
  final bool canDelete;

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
        canDelete
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
                SizedBox(
                    width: 230,
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
                                        color: CupertinoColors.secondaryLabel))
                          ]),
                    )),
                const SizedBox(
                  height: 2,
                ),
                Text(dateToAgoString(context, date),
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium)
              ],
            )
          ],
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
  const _Footer({
    Key? key,
    required this.id,
    required this.likes,
    required this.shares,
    required this.comments,
    required this.views,
    required this.liked,
    required this.onLikeTap,
    required this.onShareTap,
  }) : super(key: key);
  final int id;
  final int likes;
  final int shares;
  final int comments;
  final int views;
  final bool liked;
  final onLikeTap;
  final onShareTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(comments.toString(),
              style: AdaptiveTheme.of(context).theme.textTheme.titleMedium),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.mode_comment,
            size: 22,
          ),
        ]),
        InkWell(
          onTap: () async {
            await onShareTap(context);
          },
          child: Row(
            children: [
              Text(shares.toString(),
                  style: AdaptiveTheme.of(context).theme.textTheme.titleMedium),
              const SizedBox(
                width: 5,
              ),
              const Icon(CupertinoIcons.share),
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            await onLikeTap(context);
          },
          child: Row(
            children: [
              Text(likes.toString(),
                  style: AdaptiveTheme.of(context).theme.textTheme.titleMedium),
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
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(views.toString(),
              style: AdaptiveTheme.of(context).theme.textTheme.titleMedium),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.query_stats,
            size: 22,
          ),
        ]),
      ],
    );
  }
}
