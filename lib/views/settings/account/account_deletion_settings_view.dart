import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/elevated_button.dart';
import 'package:newpoint/components/error.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/components/text_button.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';
import 'package:newpoint/views/settings/account/account_deletion_settings_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';

class AccountDeletionSettingsView extends StatefulWidget {
  const AccountDeletionSettingsView({Key? key}) : super(key: key);

  @override
  AccountDeletionSettingsViewState createState() =>
      AccountDeletionSettingsViewState();
}

class AccountDeletionSettingsViewState
    extends State<AccountDeletionSettingsView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model =
        Provider.of<AccountDeletionSettingsViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model =
        Provider.of<AccountDeletionSettingsViewModel>(context, listen: false);
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
    final model = Provider.of<AccountDeletionSettingsViewModel>(context);

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
    final model = Provider.of<AccountDeletionSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.thisWillDeactivateYourAccount,
                  style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.youAreAboutToStartDeactivation,
                  style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.whatElseYouShouldKnow,
                  style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.youCanRestoreYourNewPoint,
                  style: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            model.step == 1
                ? TextButton(
                    onPressed: () {
                      AlertDialog alert = AlertDialog(
                        actionsAlignment: MainAxisAlignment.start,
                        actionsOverflowAlignment: OverflowBarAlignment.center,
                        title: Text(
                          AppLocalizations.of(context)!.areYouSure,
                          textAlign: TextAlign.center,
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleLarge,
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                                AppLocalizations.of(context)!.deleteAccount,
                                textAlign: TextAlign.center),
                            onPressed: () async {
                              await model.sendCode();
                              setState(() {
                                model.step = 2;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text(
                              AppLocalizations.of(context)!.cancel,
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
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
                    child: Text(
                      AppLocalizations.of(context)!.deleteAccount,
                      style: AdaptiveTheme.of(context)
                          .theme
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.errorColor),
                    ))
                : Column(
                    children: [
                      InputComponent(
                          label: AppLocalizations.of(context)!.code,
                          controller: model.codeFieldText,
                          textFieldStyle: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleSmall),
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
                              if (await model.verifyCode()) {
                                MainNavigation.resetNavigation(context);
                              }
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
                              .bodyMedium),
                    ],
                  )
          ],
        ));
  }
}
