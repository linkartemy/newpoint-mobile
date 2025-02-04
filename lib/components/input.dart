import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class InputComponent extends StatefulWidget {
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
      this.centerLabel = false,
      this.onChanged})
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
  final void Function(String)? onChanged;

  @override
  InputComponentState createState() => InputComponentState();
}

class InputComponentState extends State<InputComponent> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: widget.textFieldStyle ??
          AdaptiveTheme.of(context).theme.textTheme.titleSmall,
      textAlign: widget.textAlign,
      decoration: InputDecoration(
        alignLabelWithHint: widget.alignLabelWithHint,
        border: widget.border,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        isCollapsed: widget.isCollapsed,
        filled: true,
        fillColor: widget.fillColor ??
            AdaptiveTheme.of(context).theme.inputDecorationTheme.fillColor,
        label: widget.centerLabel
            ? Center(
                child: Text(widget.label),
              )
            : null,
        labelText: widget.centerLabel ? null : widget.label,
        labelStyle: AdaptiveTheme.of(context).theme.textTheme.bodySmall,
        floatingLabelBehavior:
            widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AdaptiveTheme.of(context).theme.iconTheme.color,
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
      ),
      obscureText: widget.obscureText ? !_passwordVisible : false,
      onChanged: widget.onChanged,
    );
  }
}
