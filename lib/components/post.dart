import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/post_date_parser.dart';

class PostComponent extends StatelessWidget {
  const PostComponent(
      {Key? key,
      required this.name,
      required this.surname,
      required this.date,
      required this.content,
      required this.images})
      : super(key: key);
  final String name;
  final String surname;
  final DateTime date;
  final String content;
  final List<Image> images;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _Header(
              name: name,
              surname: surname,
              date: date,
            ),
            const SizedBox(height: 10),
            _Body(
              content: content,
            )
          ],
        ));
  }
}

class _Header extends StatelessWidget {
  const _Header(
      {Key? key, required this.name, required this.surname, required this.date})
      : super(key: key);
  final String name;
  final String surname;
  final DateTime date;

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
                  style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
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
        const Icon(
          Icons.more_vert,
          size: 25,
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
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium)
              ],
            ))
      ],
    );
  }
}
