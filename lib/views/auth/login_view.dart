import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/button.dart';
import 'package:newpoint/components/elevated_button.dart';
import 'package:newpoint/components/error.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/components/text_button.dart';
import 'package:newpoint/resources/resources.dart';
import 'package:newpoint/views/auth/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LoginViewModel>();
    return Scaffold(
        appBar: AppBar(
          shadowColor: AdaptiveTheme.of(context).theme.appBarTheme.shadowColor,
          backgroundColor:
              AdaptiveTheme.of(context).theme.appBarTheme.backgroundColor,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          centerTitle: true,
          title: Image.asset(
            AdaptiveTheme.of(context).mode.isLight
                ? AppImages.logoTitle
                : AppImages.logoTitleDark,
            width: 100,
          ),
        ),
        body: SafeArea(
            child: Align(
                alignment: const Alignment(0, -0.1),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: RichText(
                            text: TextSpan(
                              style: AdaptiveTheme.of(context)
                                  .theme
                                  .textTheme
                                  .titleMedium,
                              children: <TextSpan>[
                                TextSpan(
                                  text: AppLocalizations.of(context)!
                                      .welcomeBackGladToSee,
                                ),
                                TextSpan(
                                    text: AppLocalizations.of(context)!.you,
                                    style: TextStyle(
                                        color: AdaptiveTheme.of(context)
                                            .theme
                                            .primaryColor)),
                                TextSpan(
                                  text: AppLocalizations.of(context)!.again,
                                ),
                              ],
                            ),
                          )),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 70),
                          child: model.token != null
                              ? const _CodeFormWidget()
                              : const _FormWidget()),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                    ]))));
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<LoginViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputComponent(
            controller: model.loginTextController,
            label: AppLocalizations.of(context)!.loginOrEmail),
        const SizedBox(height: 21),
        InputComponent(
            controller: model.passwordTextController,
            label: AppLocalizations.of(context)!.password,
            obscureText: true),
        const SizedBox(height: 25),
        ErrorComponent(error: context.select((LoginViewModel m) => m.error)),
        Container(
          alignment: Alignment.bottomRight,
          child: const _AuthButtonWidget(),
        )
      ],
    );
  }
}

class _CodeFormWidget extends StatefulWidget {
  const _CodeFormWidget({Key? key}) : super(key: key);

  @override
  _CodeFormWidgetState createState() => _CodeFormWidgetState();
}

class _CodeFormWidgetState extends State<_CodeFormWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.read<LoginViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputComponent(
            controller: model.codeTextController,
            label: AppLocalizations.of(context)!.code),
        TextButtonComponent(
          child: AppLocalizations.of(context)!.resendCode +
              (model.resendCodeCountDown > 0
                  ? " (${model.resendCodeCountDown} seconds)"
                  : ""),
          onPressed: () async {
            if (!model.resendCodeButtonAvailable) return;
            model.resendCodeButtonAvailable = false;
            await model.resendCode();
            model.timer = Timer.periodic(
              const Duration(seconds: 1),
              (Timer timer) {
                if (model.resendCodeCountDown == 0) {
                  timer.cancel();
                  model.resendCodeButtonAvailable = true;
                  setState(() {});
                } else {
                  --model.resendCodeCountDown;
                  setState(() {});
                }
              },
            );
            setState(() {});
          },
          available: model.resendCodeButtonAvailable,
        ),
        const SizedBox(height: 21),
        ErrorComponent(error: context.select((LoginViewModel m) => m.error)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ElevatedButtonComponent(
            child: AppLocalizations.of(context)!.back,
            onPressed: () async {
              model.goBack();
              setState(() {});
            },
            style: AdaptiveTheme.of(context)
                .theme
                .elevatedButtonTheme
                .style!
                .copyWith(alignment: Alignment.center),
          ),
          const _AuthButtonWidget(),
        ])
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<LoginViewModel>();
    final onPressed = model.canStartAuth ? () => model.auth(context) : null;
    final child = model.isAuthProgress
        ? const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(AppLocalizations.of(context)!.next,
            style: AdaptiveTheme.of(context)
                .theme
                .textTheme
                .bodySmall!
                .copyWith(
                    color: AdaptiveTheme.of(context)
                        .theme
                        .elevatedButtonTheme
                        .style!
                        .textStyle!
                        .resolve({MaterialState.disabled})!.color));
    return ButtonComponent(
      onPressed: onPressed,
      child: child,
    );
  }
}
