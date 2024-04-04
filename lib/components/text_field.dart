import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({Key? key,
    required this.label,
    required this.controller,
    this.textFieldStyle,
    this.onChanged,
    this.maxHeight = 100})
      : super(key: key);
  final String label;
  final TextEditingController controller;
  final TextStyle? textFieldStyle;
  final double maxHeight;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery
              .of(context)
              .size
              .width,
          minWidth: MediaQuery
              .of(context)
              .size
              .width,
          minHeight: MediaQuery
              .of(context)
              .orientation == Orientation.landscape ? 25.0 : 25.0,
          maxHeight: maxHeight,
        ),

        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: true,

          // here's the actual text box
          child: TextField(
            onChanged: onChanged,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            //grow automatically
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              alignLabelWithHint: true,
              border: const UnderlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              floatingLabelBehavior:
              FloatingLabelBehavior.never,
              labelStyle: AdaptiveTheme
                  .of(context)
                  .theme
                  .textTheme
                  .bodyLarge,
              isCollapsed: true,
            ),
            style: textFieldStyle ?? AdaptiveTheme
                .of(context)
                .theme
                .textTheme
                .bodyLarge,
          ),
          // ends the actual text box

        ),
      ),
    );
  }
}