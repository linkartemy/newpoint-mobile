import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/button.dart';
import 'package:newpoint/components/dynamic_sliver_appbar.dart';
import 'package:newpoint/components/error.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/components/setting_tab.dart';
import 'package:newpoint/components/elevated_button.dart';
import 'package:newpoint/components/text_button.dart';
import 'package:newpoint/domain/factories/screen_factory.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/profile/profile_view_model.dart';
import 'package:newpoint/views/settings/account/password_settings_view_model.dart';
import 'package:newpoint/views/settings/settings_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'account_settings_menu_view_model.dart';

class PasswordSettingsView extends StatefulWidget {
  const PasswordSettingsView({Key? key}) : super(key: key);

  @override
  PasswordSettingsViewState createState() => PasswordSettingsViewState();
}

class PasswordSettingsViewState extends State<PasswordSettingsView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model =
        Provider.of<PasswordSettingsViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model =
        Provider.of<PasswordSettingsViewModel>(context, listen: false);
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
    final model = Provider.of<PasswordSettingsViewModel>(context);

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
    final model = Provider.of<PasswordSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: model.step == 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputComponent(
                    label: AppLocalizations.of(context)!.currentPassword,
                    controller: model.currentPasswordFieldText,
                    textFieldStyle:
                        AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  InputComponent(
                    label: AppLocalizations.of(context)!.newPassword,
                    controller: model.newPasswordFieldText,
                    textFieldStyle:
                        AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  InputComponent(
                    label: AppLocalizations.of(context)!.confirmNewPassword,
                    controller: model.confirmNewPasswordFieldText,
                    textFieldStyle:
                        AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButtonComponent(
                    child: AppLocalizations.of(context)!.changePassword,
                    onPressed: () async {
                      if (!model.changePasswordButtonAvailable) return;
                      model.changePasswordButtonAvailable = false;
                      setState(() {});
                      await model.changePassword();
                      model.changePasswordButtonAvailable = true;
                      setState(() {});
                    },
                    style: AdaptiveTheme.of(context)
                        .theme
                        .elevatedButtonTheme
                        .style!
                        .copyWith(alignment: Alignment.centerLeft),
                    available: model.changePasswordButtonAvailable,
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(model.success ?? "",
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.successColor))),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputComponent(
                      label: AppLocalizations.of(context)!.code,
                      controller: model.codeFieldText,
                      textFieldStyle:
                          AdaptiveTheme.of(context).theme.textTheme.titleSmall),
                  TextButtonComponent(
                    child: AppLocalizations.of(context)!.resendCode +
                        (model.resendCodeCountDown > 0
                            ? " (${model.resendCodeCountDown} seconds)"
                            : ""),
                    onPressed: () async {
                      if (!model.resendCodeButtonAvailable) return;
                      model.resendCodeButtonAvailable = false;
                      setState(() {});
                      await model.resendCode();
                      setState(() {});
                    },
                    available: model.resendCodeButtonAvailable,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButtonComponent(
                        child: AppLocalizations.of(context)!.back,
                        onPressed: () async {
                          model.step = 1;
                          model.currentPasswordFieldText.text = "";
                          model.newPasswordFieldText.text = "";
                          model.confirmNewPasswordFieldText.text = "";
                          model.codeFieldText.text = "";
                          setState(() {});
                        },
                        style: AdaptiveTheme.of(context)
                            .theme
                            .elevatedButtonTheme
                            .style!
                            .copyWith(alignment: Alignment.center),
                      ),
                      ElevatedButtonComponent(
                        child: AppLocalizations.of(context)!.apply,
                        onPressed: () async {
                          if (!model.verifyCodeButtonAvailable) return;
                          model.verifyCodeButtonAvailable = false;
                          setState(() {});
                          await model.verifyCode();
                          model.verifyCodeButtonAvailable = true;
                          setState(() {});
                        },
                        style: AdaptiveTheme.of(context)
                            .theme
                            .elevatedButtonTheme
                            .style!
                            .copyWith(alignment: Alignment.center),
                        available: model.verifyCodeButtonAvailable,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(AppLocalizations.of(context)!.sentCode,
                      style: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.textColor)),
                ],
              ));
  }
}
