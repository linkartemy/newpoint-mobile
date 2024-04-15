import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/dynamic_sliver_appbar.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/components/setting_tab.dart';
import 'package:newpoint/domain/factories/screen_factory.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/profile/profile_view_model.dart';
import 'package:newpoint/views/settings/accessibility/accessibility_settings_menu_view_model.dart';
import 'package:newpoint/views/settings/privacy/blacklist_settings_view_model.dart';
import 'package:newpoint/views/settings/privacy/privacy_settings_menu_view_model.dart';
import 'package:newpoint/views/settings/setting_tab_data.dart';
import 'package:newpoint/views/settings/settings_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class BlacklistSettingsView extends StatefulWidget {
  const BlacklistSettingsView({Key? key}) : super(key: key);

  @override
  BlacklistSettingsViewState createState() => BlacklistSettingsViewState();
}

class BlacklistSettingsViewState extends State<BlacklistSettingsView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model =
        Provider.of<BlacklistSettingsViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model =
        Provider.of<BlacklistSettingsViewModel>(context, listen: false);
    await model.getUser();
  }

  Future<void> getBlacklist() async {
    final model =
        Provider.of<BlacklistSettingsViewModel>(context, listen: false);
    await model.getBlacklistSettings();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> reload() async {
    setState(() {
      _isLoading = true;
    });
    getUser();
    getBlacklist();
  }

  Future<void> refresh() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    getUser();
    getBlacklist();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BlacklistSettingsViewModel>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_rounded, size: 25),
          ),
        ),
        body: model.error.isNotEmpty
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 300, horizontal: 10),
                child: Text(model.error,
                    style:
                        AdaptiveTheme.of(context).theme.textTheme.bodyMedium))
            : _isLoading
                ? const LoaderView()
                : Column(
                    children: [_Header(refresh: refresh), _Body()],
                  ));
  }
}

class _Header extends StatefulWidget {
  const _Header({Key? key, required this.refresh}) : super(key: key);

  final Future<void> Function() refresh;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BlacklistSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          AppLocalizations.of(context)!.blacklistSettingsDescription,
          style: AdaptiveTheme.of(context).theme.textTheme.bodySmall,
        ));
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<BlacklistSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: model.blacklist.length,
              itemBuilder: (context, index) {
                final user = model.blacklist[index];
                return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          MainNavigationRouteNames.profile,
                          arguments: user.id);
                    },
                    child: ListTile(
                      leading:
                          ProfileImage(profileImageId: model.blacklist[index].profileImageId),
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 210,
                              child: Text(
                                "${user.name} ${user.surname}",
                                style: AdaptiveTheme.of(context)
                                    .theme
                                    .textTheme
                                    .bodyLarge,
                              ),
                            ),
                            SizedBox(
                                width: 210,
                                child: Text(
                                  "@${user.login}",
                                  style: AdaptiveTheme.of(context)
                                      .theme
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: AdaptiveTheme.of(context)
                                              .theme
                                              .colorScheme
                                              .secondary),
                                ))
                          ]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () async {
                          await model.removeUserFromBlacklist(user.id);
                          model.blacklist.remove(user);
                        },
                      ),
                    ));
              },
            ),
          ],
        ));
  }
}
