import 'package:flutter/cupertino.dart';

class SettingTabData {
  final String title;
  final String description;
  final IconData icon;
  final String navigationRoute;

  SettingTabData({
    required this.title,
    required this.description,
    required this.icon,
    required this.navigationRoute,
  });
}