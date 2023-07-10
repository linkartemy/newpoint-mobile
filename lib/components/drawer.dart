import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';

class DrawerComponent extends StatelessWidget {
  DrawerComponent({Key? key}) : super(key: key);

  var _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Column(
                          children: [Text('Username')],
                          crossAxisAlignment: CrossAxisAlignment.stretch)),
                  ListTile(
                    title: const Text('Main'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Profile'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Bookmarks'),
                    onTap: () {},
                  ),
                ]),
          ),
          Container(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('Settings')),
                      ListTile(
                          onTap: () {
                            AlertDialog alert = AlertDialog(
                              title: Text("Would you like to log out?"),
                              actions: [
                                TextButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text("Log out"),
                                  onPressed: () async {
                                    await _authService.logout();
                                    MainNavigation.resetNavigation(context);
                                  },
                                ),
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          },
                          leading: Icon(Icons.logout),
                          title: Text(
                            'Log out',
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .bodySmall,
                          ))
                    ],
                  ))),
        ]),
      ),
    );
  }
}
