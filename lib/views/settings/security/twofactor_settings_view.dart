import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/settings/security/twofactor_settings_view_model.dart';
import 'package:provider/provider.dart';

class TwoFactorSettingsView extends StatefulWidget {
  const TwoFactorSettingsView({Key? key}) : super(key: key);

  @override
  TwoFactorSettingsViewState createState() => TwoFactorSettingsViewState();
}

class TwoFactorSettingsViewState extends State<TwoFactorSettingsView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model =
        Provider.of<TwoFactorSettingsViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model =
        Provider.of<TwoFactorSettingsViewModel>(context, listen: false);
    await model.getUser();
  }

  Future<void> getTwoFactorSettings() async {
    final model =
        Provider.of<TwoFactorSettingsViewModel>(context, listen: false);
    await model.getTwoFactorSettings();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> reload() async {
    setState(() {
      _isLoading = true;
    });
    getUser();
    getTwoFactorSettings();
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
    getTwoFactorSettings();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<TwoFactorSettingsViewModel>(context);

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
    final model = Provider.of<TwoFactorSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(
          AppLocalizations.of(context)!.twoFactorAuthenticationDescription,
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
    final model = Provider.of<TwoFactorSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Text(
              AppLocalizations.of(context)!.twoFactorAuthenticationText,
              style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Switch(
                value: model.twoFactorEnabled,
                onChanged: (value) {
                  model.setTwoFactorSettings(value);
                }),
          ],
        ));
  }
}
