import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/checkbox.dart';

class SelectButtonComponent extends StatelessWidget {
  const SelectButtonComponent(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.onChanged,
      required this.isSelected,
      this.style,
      this.checkColor = Colors.white,
      this.fillColor = Colors.white,
      this.borderColor = Colors.white70})
      : super(key: key);
  final void Function()? onPressed;
  final void Function(bool) onChanged;
  final String text;
  final bool isSelected;
  final ButtonStyle? style;
  final Color checkColor;
  final Color fillColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style ?? AdaptiveTheme.of(context).theme.elevatedButtonTheme.style,
      child: Row(
        children: [
          CheckBoxComponent(
            checkedIconColor: checkColor,
            checkedFillColor: fillColor,
            uncheckedIconColor: checkColor,
            uncheckedFillColor: fillColor,
            value: isSelected,
            borderWidth: 1,
            borderColor: borderColor,
            borderRadius: 100,
            onChanged: onChanged,
            shouldShowBorder: true,
          ),
          Text(text)
        ],
      ),
    );
  }
}
