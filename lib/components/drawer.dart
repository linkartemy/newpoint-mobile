import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';

class DrawerComponent extends StatelessWidget {
  DrawerComponent({Key? key, required this.user}) : super(key: key);

  final User? user;
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DrawerHeader(
                      decoration: const BoxDecoration(color: Colors.blue),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                user != null
                                    ? "${user?.name} ${user?.surname}"
                                    : "Unknown",
                                style: AdaptiveTheme.of(context)
                                    .theme
                                    .textTheme
                                    .titleMedium)
                          ])),
                  ListTile(
                    title: Text('Main',
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Profile',
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Bookmarks',
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium),
                    onTap: () {},
                  ),
                ]),
          ),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: <Widget>[
                  const Divider(),
                  ListTile(
                      leading: Icon(Icons.settings),
                      title: Text(
                        'Settings',
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium,
                      )),
                  ListTile(
                      onTap: () {
                        AlertDialog alert = AlertDialog(
                          title: const Text("Would you like to log out?"),
                          actions: [
                            TextButton(
                              child: const Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text("Log out"),
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
                      leading: const Icon(Icons.logout),
                      title: Text(
                        'Log out',
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium,
                      ))
                ],
              )),
        ]),
      ),
    );
  }
}
