import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  const InputComponent(
      {Key? key,
      required this.label,
      required this.controller,
      this.obscureText = false,
      this.textFieldStyle,
      this.fillColor,
      this.floatingLabelBehavior,
      this.isCollapsed = false})
      : super(key: key);
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextStyle? textFieldStyle;
  final Color? fillColor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: textFieldStyle ??
          AdaptiveTheme.of(context).theme.textTheme.titleSmall,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isCollapsed: isCollapsed,
          filled: true,
          fillColor: fillColor ??
              AdaptiveTheme.of(context).theme.inputDecorationTheme.fillColor,
          labelText: label,
          labelStyle: AdaptiveTheme.of(context).theme.textTheme.bodySmall,
          floatingLabelBehavior:
              floatingLabelBehavior ?? FloatingLabelBehavior.auto),
      obscureText: obscureText,
    );
  }
}
