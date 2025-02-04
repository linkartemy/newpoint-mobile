import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/views/theme/theme.dart';

class TextButtonComponent extends StatelessWidget {
  const TextButtonComponent(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.style = null,
      this.available = true})
      : super(key: key);
  final onPressed;
  final String child;
  final ButtonStyle? style;
  final bool available;

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = style ??
        AdaptiveTheme.of(context).theme.textButtonTheme.style!.copyWith(
            backgroundColor: MaterialStateProperty.all(Colors.transparent));
    TextStyle textStyle = AdaptiveTheme.of(context)
        .theme
        .textTheme
        .bodySmall!
        .copyWith(color: AppColors.primary);
    if (!available) {
      textStyle = textStyle.copyWith(color: Colors.grey);
    }
    return TextButton(
      onPressed: onPressed,
      child: Text(child, style: textStyle),
      style: buttonStyle,
    );
  }
}
