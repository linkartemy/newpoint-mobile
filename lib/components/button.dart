import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {Key? key, required this.child, required this.onPressed, this.style})
      : super(key: key);
  final void Function()? onPressed;
  final Widget child;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? AdaptiveTheme.of(context).theme.elevatedButtonTheme.style,
      child: child,
    );
  }
}
