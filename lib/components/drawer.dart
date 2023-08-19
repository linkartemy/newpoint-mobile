import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/domain/services/user_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerComponent extends StatelessWidget {
  DrawerComponent({Key? key, required this.user}) : super(key: key);

  final User? user;
  final _userService = UserService();

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
                    title: Text(AppLocalizations.of(context)!.main,
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium),
                    onTap: () {
                      Navigator.of(context).popAndPushNamed(MainNavigationRouteNames.main);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.profile,
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium),
                    onTap: () {
                      Navigator.of(context).pushNamed(MainNavigationRouteNames.profile, arguments: user!.id);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.bookMarks,
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
                        AppLocalizations.of(context)!.settings,
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleMedium,
                      )),
                  ListTile(
                      onTap: () {
                        AlertDialog alert = AlertDialog(
                          title: Text(AppLocalizations.of(context)!.logOutConfirmation),
                          actions: [
                            TextButton(
                              child: Text(AppLocalizations.of(context)!.cancel),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text(AppLocalizations.of(context)!.logOut),
                              onPressed: () async {
                                await _userService.logout();
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
                        AppLocalizations.of(context)!.logOut,
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
