import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  const InputComponent(
      {Key? key,
      required this.label,
      required this.controller,
      this.textAlign = TextAlign.start,
      this.obscureText = false,
      this.textFieldStyle,
      this.fillColor,
      this.floatingLabelBehavior,
      this.border = InputBorder.none,
      this.isCollapsed = false,
      this.alignLabelWithHint = false,
      this.centerLabel = false})
      : super(key: key);
  final String label;
  final TextEditingController controller;
  final TextAlign textAlign;

  final bool obscureText;
  final TextStyle? textFieldStyle;
  final Color? fillColor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final InputBorder border;
  final bool isCollapsed;
  final bool alignLabelWithHint;
  final bool centerLabel;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: textFieldStyle ??
          AdaptiveTheme.of(context).theme.textTheme.titleSmall,
      textAlign: textAlign,
      decoration: InputDecoration(
          alignLabelWithHint: alignLabelWithHint,
          border: border,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isCollapsed: isCollapsed,
          filled: true,
          fillColor: fillColor ??
              AdaptiveTheme.of(context).theme.inputDecorationTheme.fillColor,
          label: centerLabel
              ? Center(
                  child: Text(label),
                )
              : null,
          labelText: centerLabel ? null : label,
          labelStyle: AdaptiveTheme.of(context).theme.textTheme.bodySmall,
          floatingLabelBehavior:
              floatingLabelBehavior ?? FloatingLabelBehavior.auto),
      obscureText: obscureText,
    );
  }
}
