import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/date_parser.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/views/theme/theme.dart';

class CommentComponent extends StatelessWidget {
  const CommentComponent(
      {Key? key,
      required this.index,
      required this.id,
      required this.userId,
      required this.login,
      required this.name,
      required this.surname,
      required this.date,
      required this.content,
      required this.likes,
      required this.liked,
      required this.onLikeTap,
      required this.reload,
      required this.deleteComment,
      required this.canDelete})
      : super(key: key);
  final int index;
  final int id;
  final int userId;
  final String login;
  final String name;
  final String surname;
  final DateTime date;
  final String content;
  final int likes;
  final bool liked;
  final onLikeTap;
  final Future<void> Function() reload;
  final Future<void> Function() deleteComment;
  final bool canDelete;

  Future<void> onTap(BuildContext context) async {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.post, arguments: id);
  }

  Future<void> onHeaderTap(BuildContext context) async {
    await Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.profile, arguments: userId);
    await reload();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
            onTap: () async {
              await onHeaderTap(context);
            },
            child: _Header(
              login: login,
              name: name,
              surname: surname,
              date: date,
              deleteComment: deleteComment,
              canDelete: canDelete,
            )),
        _Body(
          index: index,
          content: content,
          likes: likes,
          liked: liked,
          onLikeTap: onLikeTap,
        ),
        const SizedBox(height: 5),
        _Footer(
          id: id,
          likes: likes,
          liked: liked,
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header(
      {Key? key,
      required this.login,
      required this.name,
      required this.surname,
      required this.date,
      required this.deleteComment,
      required this.canDelete})
      : super(key: key);
  final String login;
  final String name;
  final String surname;
  final DateTime date;
  final Future<void> Function() deleteComment;
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
                child: Text(AppLocalizations.of(context)!.deleteComment,
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
                          await deleteComment();
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                  text: "$name $surname ",
                  style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                  children: [
                    TextSpan(
                        text: "@$login",
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .bodySmall!
                            .copyWith(color: CupertinoColors.secondaryLabel))
                  ]),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(AppLocalizations.of(context)!.commentDateTime(date, date),
                style: AdaptiveTheme.of(context).theme.textTheme.bodySmall)
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
              size: 18,
            ),
          ),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body(
      {Key? key,
      required this.index,
      required this.content,
      required this.likes,
      required this.liked,
      required this.onLikeTap})
      : super(key: key);
  final int index;
  final String content;
  final int likes;
  final bool liked;
  final Future<void> Function(int) onLikeTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Text(content,
                style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium)),
        InkWell(
          onTap: () async {
            await onLikeTap(index);
          },
          child: Row(
            children: [
              Text(likes.toString(),
                  style: AdaptiveTheme.of(context).theme.textTheme.titleSmall),
              const SizedBox(
                width: 5,
              ),
              liked
                  ? const Icon(
                      CupertinoIcons.heart_solid,
                      color: AppColors.primary,
                      size: 18,
                    )
                  : const Icon(
                      CupertinoIcons.heart,
                      size: 18,
                    )
            ],
          ),
        )
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    Key? key,
    required this.id,
    required this.likes,
    required this.liked,
  }) : super(key: key);
  final int id;
  final int likes;
  final bool liked;

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [],
    );
  }
}
