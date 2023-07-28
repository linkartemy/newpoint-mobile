import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.style = null})
      : super(key: key);
  final onPressed;
  final Widget child;
  final style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
      style: style ?? AdaptiveTheme.of(context).theme.elevatedButtonTheme.style,
    );
  }
}
