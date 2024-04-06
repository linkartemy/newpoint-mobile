import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/views/theme/theme.dart';

class DropdownButtonComponent extends StatefulWidget {
  const DropdownButtonComponent({super.key, required this.list});

  final List<String> list;

  @override
  State<DropdownButtonComponent> createState() => _DropdownButtonComponentState();
}

class _DropdownButtonComponentState extends State<DropdownButtonComponent> {

  @override
  Widget build(BuildContext context) {
  String dropdownValue = widget.list.first;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down, size: 14,),
      elevation: 16,
      style: AdaptiveTheme.of(context).theme.textTheme.bodySmall,
      underline: Container(
        height: 2,
        color: AppColors.primary,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
