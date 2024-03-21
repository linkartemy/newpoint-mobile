import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/dynamic_sliver_appbar.dart';
import 'package:newpoint/components/error.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/components/post.dart';
import 'package:newpoint/components/profile_image.dart';
import 'package:newpoint/components/setting_tab.dart';
import 'package:newpoint/components/text_button.dart';
import 'package:newpoint/domain/factories/screen_factory.dart';
import 'package:newpoint/domain/models/post/post.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/profile/profile_view_model.dart';
import 'package:newpoint/views/settings/account/account_settings_view_model.dart';
import 'package:newpoint/views/settings/setting_tab_data.dart';
import 'package:newpoint/views/settings/settings_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'account_settings_menu_view_model.dart';

class AccountSettingsView extends StatefulWidget {
  const AccountSettingsView({Key? key}) : super(key: key);

  @override
  AccountSettingsViewState createState() => AccountSettingsViewState();
}

class AccountSettingsViewState extends State<AccountSettingsView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model = Provider.of<AccountSettingsViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model = Provider.of<AccountSettingsViewModel>(context, listen: false);
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
    final model = Provider.of<AccountSettingsViewModel>(context);

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
                    children: [_Body()],
                  ));
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AccountSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ChangePhone(),
            SizedBox(height: 20),
            _ChangeEmail(),
          ],
        ));
  }
}

class _ChangeEmail extends StatefulWidget {
  const _ChangeEmail({Key? key}) : super(key: key);

  @override
  _ChangeEmailState createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<_ChangeEmail> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AccountSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        child: model.stepEmail == 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputComponent(
                      label: AppLocalizations.of(context)!.changeEmail,
                      controller: model.emailFieldText,
                      textFieldStyle: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.textColor)),
                  model.successEmail.isNotEmpty
                      ? Container(
                          alignment: Alignment.center,
                          child: Text(model.successEmail,
                              style: AdaptiveTheme.of(context)
                                  .theme
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.successColor)))
                      : Container(),
                  ErrorComponent(error: model.errorEmail),
                  const SizedBox(height: 20),
                  TextButtonComponent(
                    child: AppLocalizations.of(context)!.apply,
                    onPressed: () async {
                      await model.changeEmail();
                      setState(() {});
                    },
                    style: AdaptiveTheme.of(context)
                        .theme
                        .elevatedButtonTheme
                        .style!
                        .copyWith(alignment: Alignment.center),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputComponent(
                      label: AppLocalizations.of(context)!.code,
                      controller: model.emailCodeFieldText,
                      textFieldStyle: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColors.textColor)),
                  ErrorComponent(error: model.errorEmail),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonComponent(
                        child: AppLocalizations.of(context)!.back,
                        onPressed: () async {
                          model.stepEmail = 1;
                          model.emailFieldText.text = model.currentEmail ?? "";
                          model.emailCodeFieldText.text = "";
                          setState(() {});
                        },
                        style: AdaptiveTheme.of(context)
                            .theme
                            .elevatedButtonTheme
                            .style!
                            .copyWith(alignment: Alignment.center),
                      ),
                      TextButtonComponent(
                        child: AppLocalizations.of(context)!.apply,
                        onPressed: () async {
                          await model.verifyEmail();
                          setState(() {});
                        },
                        style: AdaptiveTheme.of(context)
                            .theme
                            .elevatedButtonTheme
                            .style!
                            .copyWith(alignment: Alignment.center),
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

class _ChangePhone extends StatefulWidget {
  const _ChangePhone({Key? key}) : super(key: key);

  @override
  _ChangePhoneState createState() => _ChangePhoneState();
}

class _ChangePhoneState extends State<_ChangePhone> {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AccountSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputComponent(
                label: AppLocalizations.of(context)!.changePhone,
                controller: model.phoneFieldText,
                textFieldStyle: AdaptiveTheme.of(context)
                    .theme
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColors.textColor)),
            model.successPhone.isNotEmpty
                ? Container(
                    alignment: Alignment.center,
                    child: Text(model.successPhone ?? "",
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.successColor)))
                : Container(),
            ErrorComponent(error: model.errorPhone),
            const SizedBox(height: 20),
            TextButtonComponent(
              child: AppLocalizations.of(context)!.apply,
              onPressed: () async {
                await model.changePhone();
                setState(() {});
              },
              style: AdaptiveTheme.of(context)
                  .theme
                  .elevatedButtonTheme
                  .style!
                  .copyWith(alignment: Alignment.center),
            ),
          ],
        ));
  }
}
