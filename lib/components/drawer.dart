import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/domain/models/user/user.dart';
import 'package:newpoint/domain/services/auth_service.dart';
import 'package:newpoint/domain/services/user_service.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/views/theme/theme.dart';

class DrawerComponent extends StatelessWidget {
  DrawerComponent({Key? key, required this.user, required this.reload})
      : super(key: key);

  final User? user;
  final _userService = UserService();
  final Future<void> Function() reload;

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
                      decoration: const BoxDecoration(),
                      padding: const EdgeInsets.only(left: 30, top: 17),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                ProfileImage(
                                    profileImageId: user != null
                                        ? user!.profileImageId
                                        : 0),
                                const SizedBox(width: 17),
                                Column(
                                  children: [
                                    Text("${user!.followers} followers",
                                        style: AdaptiveTheme.of(context)
                                            .theme
                                            .textTheme
                                            .titleSmall),
                                    const SizedBox(height: 5),
                                    Text("${user!.following} following",
                                        style: AdaptiveTheme.of(context)
                                            .theme
                                            .textTheme
                                            .titleSmall)
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                                user != null
                                    ? "${user?.name} ${user?.surname}"
                                    : "Unknown",
                                style: AdaptiveTheme.of(context)
                                    .theme
                                    .textTheme
                                    .titleMedium),
                            const SizedBox(height: 2),
                            Text(user != null ? "@${user?.login}" : "Unknown",
                                style: AdaptiveTheme.of(context)
                                    .theme
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: AppColors.secondaryTextColor))
                          ])),
                  Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Column(children: [
                        ListTile(
                          leading: const Icon(CupertinoIcons.app_badge,
                              color: Colors.black),
                          title: Text(AppLocalizations.of(context)!.main,
                              style: AdaptiveTheme.of(context)
                                  .theme
                                  .textTheme
                                  .titleLarge),
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(
                                MainNavigationRouteNames.main);
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            CupertinoIcons.profile_circled,
                            color: Colors.black,
                          ),
                          title: Text(AppLocalizations.of(context)!.profile,
                              style: AdaptiveTheme.of(context)
                                  .theme
                                  .textTheme
                                  .titleLarge),
                          onTap: () async {
                            await Navigator.of(context).pushNamed(
                                MainNavigationRouteNames.profile,
                                arguments: user!.id);
                            await reload();
                          },
                        ),
                        ListTile(
                          leading: const Icon(CupertinoIcons.bookmark,
                              color: Colors.black),
                          title: Text(AppLocalizations.of(context)!.bookMarks,
                              style: AdaptiveTheme.of(context)
                                  .theme
                                  .textTheme
                                  .titleLarge),
                          onTap: () {},
                        )
                      ])),
                ]),
          ),
          Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: <Widget>[
                  const Divider(),
                  ListTile(
                      leading: const Icon(Icons.settings),
                      title: Text(
                        AppLocalizations.of(context)!.settings,
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .titleLarge,
                      )),
                  ListTile(
                      onTap: () {
                        AlertDialog alert = AlertDialog(
                          title: Text(
                              AppLocalizations.of(context)!.logOutConfirmation),
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
                            .titleLarge,
                      ))
                ],
              )),
        ]),
      ),
    );
  }
}
