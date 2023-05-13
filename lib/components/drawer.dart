import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Username'),
          ),
          ListTile(
            title: const Text('Main'),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text('Bookmarks'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}