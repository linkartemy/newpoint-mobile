import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/button.dart';
import 'package:newpoint/components/error.dart';
import 'package:newpoint/components/input.dart';
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
            AppImages.logoTitleOutline,
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
        ErrorComponent(
            error: context.select((LoginViewModel m) => m.errorMessage)),
        Container(
          alignment: Alignment.bottomRight,
          child: const _AuthButtonWidget(),
        )
      ],
    );
  }
}

class _CodeFormWidget extends StatelessWidget {
  const _CodeFormWidget({Key? key}) : super(key: key);

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
        const SizedBox(height: 21),
        ErrorComponent(
            error: context.select((LoginViewModel m) => m.errorMessage)),
        Container(
          alignment: Alignment.bottomRight,
          child: const _AuthButtonWidget(),
        )
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
        : Text(AppLocalizations.of(context)!.next);
    return ButtonComponent(
      onPressed: onPressed,
      child: child,
    );
  }
}
