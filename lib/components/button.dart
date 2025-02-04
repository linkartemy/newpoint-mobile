import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/views/theme/theme.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.style = null,
      this.available = true})
      : super(key: key);
  final void Function()? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final bool available;

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = style ??
        AdaptiveTheme.of(context).theme.elevatedButtonTheme.style!.copyWith();
    TextStyle textStyle = AdaptiveTheme.of(context)
        .theme
        .textTheme
        .bodySmall!
        .copyWith(color: AppColors.primary);
    bool buttonHasBackground = buttonStyle.backgroundColor != null &&
        buttonStyle.backgroundColor !=
            MaterialStateProperty.all(Colors.transparent);
    if (buttonHasBackground) {
      textStyle = textStyle.copyWith(color: AppColors.buttonTextColor);
    }
    if (!available) {
      if (!buttonHasBackground) {
        textStyle = textStyle.copyWith(color: Colors.grey);
      } else {
        buttonStyle = buttonStyle.copyWith(
            backgroundColor: MaterialStateProperty.all(Colors.grey));
      }
    }

    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? AdaptiveTheme.of(context).theme.elevatedButtonTheme.style,
      child: child,
    );
  }
}
