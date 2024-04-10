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
import 'package:newpoint/views/settings/privacy/sensitive_content_settings_view_model.dart';
import 'package:newpoint/views/settings/setting_tab_data.dart';
import 'package:newpoint/views/settings/settings_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SensitiveContentSettingsView extends StatefulWidget {
  const SensitiveContentSettingsView({Key? key}) : super(key: key);

  @override
  SensitiveContentSettingsViewState createState() => SensitiveContentSettingsViewState();
}

class SensitiveContentSettingsViewState extends State<SensitiveContentSettingsView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model =
        Provider.of<SensitiveContentSettingsViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model =
        Provider.of<SensitiveContentSettingsViewModel>(context, listen: false);
    await model.getUser();
  }

  Future<void> getSettings() async {
    final model =
        Provider.of<SensitiveContentSettingsViewModel>(context, listen: false);
    await model.getSensitiveContentSettings();
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
    getSettings();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SensitiveContentSettingsViewModel>(context);

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
    final model = Provider.of<SensitiveContentSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          AppLocalizations.of(context)!.showSensitiveContent,
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
    final model = Provider.of<SensitiveContentSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Switch(value: model.sensitiveContent, onChanged: (value) {
              model.setSensitiveContentSettings(value);
            }),
          ],
        ));
  }
}
