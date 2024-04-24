import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/components/setting_tab.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/settings/setting_tab_data.dart';
import 'package:newpoint/views/settings/settings_view_model.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends State<SettingsView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model = Provider.of<SettingsViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model = Provider.of<SettingsViewModel>(context, listen: false);
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
    final model = Provider.of<SettingsViewModel>(context);

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
  const _Header({
    Key? key,
    required this.refresh,
  }) : super(key: key);

  final Function refresh;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<_Header> {
  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InputComponent(
              label: AppLocalizations.of(context)!.setting,
              controller: model.settingsNameFieldText,
              textAlign: TextAlign.center,
              textFieldStyle: AdaptiveTheme.of(context)
                  .theme
                  .textTheme
                  .titleSmall!
                  .copyWith(
                      color: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .titleSmall!
                          .color),
              fillColor: Colors.transparent,
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AdaptiveTheme.of(context)
                          .theme
                          .inputDecorationTheme
                          .border!
                          .borderSide
                          .color)),
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              centerLabel: true,
              onChanged: (value) async {
                await widget.refresh();
              },
            )
          ],
        ));
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsViewModel>(context);

    final settings = <SettingTabData>[
      SettingTabData(
        title: AppLocalizations.of(context)!.accountSettings,
        description: AppLocalizations.of(context)!.accountSettingsDescription,
        icon: Icons.account_circle_rounded,
        navigationRoute: MainNavigationRouteNames.accountSettingsMenu,
      ),
      SettingTabData(
        title: AppLocalizations.of(context)!.securitySettings,
        description: AppLocalizations.of(context)!.securitySettingsDescription,
        icon: Icons.safety_check,
        navigationRoute: MainNavigationRouteNames.securitySettingsMenu,
      ),
      SettingTabData(
        title: AppLocalizations.of(context)!.privacySettings,
        description: AppLocalizations.of(context)!.privacySettingsDescription,
        icon: Icons.privacy_tip_outlined,
        navigationRoute: MainNavigationRouteNames.privacySettingsMenu,
      ),
      SettingTabData(
        title: AppLocalizations.of(context)!.accessibilitySettings,
        description:
            AppLocalizations.of(context)!.accessibilitySettingsDescription,
        icon: Icons.accessibility,
        navigationRoute: MainNavigationRouteNames.accessibilitySettingsMenu,
      ),
    ];

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: settings.length,
            itemBuilder: (context, index) {
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
            }));
  }
}
