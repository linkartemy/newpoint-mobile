import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class PostComponent extends StatelessWidget {
  const PostComponent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_Header(), SizedBox(height: 10), _Body()],
        ));
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                child: Icon(Icons.ice_skating), margin: EdgeInsets.all(10)),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Container(
                    child: Text(
                  "Jack Krier",
                  style: AdaptiveTheme.of(context).theme.textTheme.titleMedium,
                )),
                SizedBox(
                  height: 2,
                ),
                Container(
                    child: Text("21.06.2017",
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleSmall))
              ],
            )
          ],
        ),
        Container(
          child: Icon(Icons.ac_unit_sharp),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                Text("Title",
                    style:
                        AdaptiveTheme.of(context).theme.textTheme.titleMedium),
                Text("gfwfgwef",
                    style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium)
              ],
            ))
      ],
    );
  }
}
