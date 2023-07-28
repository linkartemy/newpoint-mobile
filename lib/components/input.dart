import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  const InputComponent(
      {Key? key,
      required this.label,
      this.controller,
      this.obscureText = false})
      : super(key: key);
  final String label;
  final controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
      decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          isCollapsed: false,
          filled: true,
          fillColor:
              AdaptiveTheme.of(context).theme.inputDecorationTheme.fillColor,
          labelText: label,
          labelStyle: AdaptiveTheme.of(context).theme.textTheme.bodySmall),
      obscureText: obscureText,
    );
  }
}
