import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class TextButtonComponent extends StatelessWidget {
  const TextButtonComponent(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.style = null})
      : super(key: key);
  final onPressed;
  final String child;
  final style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(child),
      style: style ?? AdaptiveTheme.of(context).theme.textButtonTheme.style,
    );
  }
}
