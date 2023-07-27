import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/post_date_parser.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';

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
      required this.onLikeTap})
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

  Future<void> onTap(BuildContext context) async {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.post, arguments: id);
  }

  Future<void> onHeaderTap(BuildContext context) async {
    Navigator.of(context)
        .pushNamed(MainNavigationRouteNames.profile, arguments: userId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
        ));
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
                            .titleSmall!
                            .copyWith(color: CupertinoColors.secondaryLabel))
                  ]),
            ),
            const SizedBox(
              width: 2,
            ),
            Text(convertCommentDateToString(date)!,
                style: AdaptiveTheme.of(context).theme.textTheme.titleSmall)
          ],
        ),
        InkWell(
          onTap: onDetailsTap,
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
  final onLikeTap;
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
            await onLikeTap(context, index);
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
