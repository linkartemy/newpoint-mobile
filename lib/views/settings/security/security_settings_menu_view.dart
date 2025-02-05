import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/setting_tab.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/settings/security/security_settings_menu_view_model.dart';
import 'package:newpoint/views/settings/setting_tab_data.dart';
import 'package:provider/provider.dart';

class SecuritySettingsMenuView extends StatefulWidget {
  const SecuritySettingsMenuView({Key? key}) : super(key: key);

  @override
  SecuritySettingsMenuViewState createState() =>
      SecuritySettingsMenuViewState();
}

class SecuritySettingsMenuViewState extends State<SecuritySettingsMenuView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model =
        Provider.of<SecuritySettingsMenuViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model =
        Provider.of<SecuritySettingsMenuViewModel>(context, listen: false);
    await model.getUser();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> reload() async {
    setState(() {
      _isLoading = true;
    });
    getUser();
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
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SecuritySettingsMenuViewModel>(context);

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
    final model = Provider.of<SecuritySettingsMenuViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          AppLocalizations.of(context)!.privacySettingsDescription,
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
    final model = Provider.of<SecuritySettingsMenuViewModel>(context);

    final settings = <SettingTabData>[
      SettingTabData(
        title: AppLocalizations.of(context)!.twoFactorAuthentication,
        description:
            AppLocalizations.of(context)!.twoFactorAuthenticationDescription,
        icon: Icons.lock,
        navigationRoute: MainNavigationRouteNames.twoFactorSettings,
      )
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: settings.length,
          itemBuilder: (BuildContext context, int index) {
            if (model.settingsNameFieldText.value.text.isNotEmpty) {
              if (settings[index]
                  .title
                  .toString()
                  .toLowerCase()
                  .contains(model.settingsNameFieldText.value.text)) {
                return SettingTab(
                  title: settings[index].title,
                  description: settings[index].description,
                  icon: settings[index].icon,
                  navigationRoute: settings[index].navigationRoute,
                );
              }
              return const SizedBox();
            }
            return SettingTab(
              title: settings[index].title,
              description: settings[index].description,
              icon: settings[index].icon,
              navigationRoute: settings[index].navigationRoute,
            );
          }),
    );
  }
}
