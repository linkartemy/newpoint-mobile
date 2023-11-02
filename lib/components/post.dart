import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/date_parser.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/views/theme/theme.dart';

class PostComponent extends StatelessWidget {
  const PostComponent(
      {Key? key,
      required this.id,
      required this.login,
      required this.name,
      required this.surname,
      this.profileImage,
      required this.date,
      required this.content,
      required this.images,
      required this.likes,
      required this.liked,
      required this.shares,
      required this.comments,
      required this.onShareTap,
      required this.onLikeTap,
      required this.onTap})
      : super(key: key);
  final int id;
  final String login;
  final String name;
  final String surname;
  final NetworkImage? profileImage;
  final DateTime date;
  final String content;
  final List<Image> images;
  final int likes;
  final bool liked;
  final int shares;
  final int comments;
  final onShareTap;
  final onLikeTap;
  final onTap;

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
              profileImage: profileImage,
              date: date,
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
      this.profileImage,
      required this.date})
      : super(key: key);
  final String login;
  final String name;
  final String surname;
  final NetworkImage? profileImage;
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
                child: CircleAvatar(
                    radius: 28,
                    backgroundImage: profileImage ?? NetworkImage("https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg"))),
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
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium)
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
                  ? const Icon(CupertinoIcons.heart_solid, color: AppColors.primary)
                  : const Icon(CupertinoIcons.heart),
            ],
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(comments.toString(),
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
