import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/error.dart';
import 'package:newpoint/components/select_button.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/settings/accessibility/theme_settings_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';

class ThemeSettingsView extends StatefulWidget {
  const ThemeSettingsView({Key? key}) : super(key: key);

  @override
  ThemeSettingsViewState createState() => ThemeSettingsViewState();
}

class ThemeSettingsViewState extends State<ThemeSettingsView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model = Provider.of<ThemeSettingsViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model = Provider.of<ThemeSettingsViewModel>(context, listen: false);
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
    final model = Provider.of<ThemeSettingsViewModel>(context);
    model.isLightTheme = AdaptiveTheme.of(context).mode.isLight;

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
        body: _isLoading
            ? const LoaderView()
            : Column(
                children: [_Body(), ErrorComponent(error: model.error)],
              ));
  }
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ThemeSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: SelectButtonComponent(
                      text: "Regular",
                      onPressed: () {
                        AdaptiveTheme.of(context).setLight();
                        model.isLightTheme = true;
                        setState(() {});
                      },
                      borderColor: Colors.transparent,
                      onChanged: (value) {},
                      isSelected: model.isLightTheme,
                      style: AdaptiveTheme.of(context)
                          .theme
                          .elevatedButtonTheme
                          .style!
                          .copyWith(
                              textStyle: MaterialStateProperty.all(
                                  AdaptiveTheme.of(context)
                                      .theme
                                      .textTheme
                                      .titleSmall),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      side: BorderSide(
                                          color: model.isLightTheme
                                              ? AppColors.primary
                                              : Colors.white70))),
                              foregroundColor: MaterialStateProperty.all(
                                  AdaptiveTheme.of(context).theme.textTheme.titleSmall!.color),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent)),
                      fillColor: AppColors.primary,
                    )),
                const SizedBox(width: 10),
                Expanded(
                    flex: 3,
                    child: SelectButtonComponent(
                      text: "Deep",
                      onPressed: () {
                        AdaptiveTheme.of(context).setDark();
                        model.isLightTheme = false;
                        setState(() {});
                      },
                      borderColor: Colors.white70,
                      onChanged: (value) {},
                      isSelected: !model.isLightTheme,
                      style: AdaptiveTheme.of(context)
                          .theme
                          .elevatedButtonTheme
                          .style!
                          .copyWith(
                              textStyle: MaterialStateProperty.all(AdaptiveTheme.of(context)
                                  .theme
                                  .textTheme
                                  .titleSmall),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      side: model.isLightTheme
                                          ? BorderSide.none
                                          : BorderSide(
                                              color: AppColors.primary),
                                      borderRadius: BorderRadius.circular(8))),
                              foregroundColor: MaterialStateProperty.all(
                                  AppColors.buttonTextColor),
                              backgroundColor: MaterialStateProperty.all(
                                  AppColorsDarkTheme.scaffoldBackgroundColor)),
                      fillColor: Colors.transparent,
                    ))
              ],
            )
          ],
        ));
  }
}
