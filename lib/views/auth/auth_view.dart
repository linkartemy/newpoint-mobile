import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/elevated_button.dart';
import 'package:newpoint/resources/resources.dart';
import 'package:newpoint/views/navigation/main_navigation.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [_LogoWidget(), _TextWidget(), _AuthButtonsWidget()],
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 100),
      child: Image.asset(
        AdaptiveTheme.of(context).mode.isLight
            ? AppImages.logoTitleRounded
            : AppImages.logoTitleRoundedDark,
        width: 200,
      ),
    );
  }
}

class _TextWidget extends StatelessWidget {
  const _TextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 51),
      child: Text(AppLocalizations.of(context)!.theBestPlace,
          style: AdaptiveTheme.of(context)
              .theme
              .textTheme
              .titleMedium
              ?.copyWith(
                  color: AdaptiveTheme.of(context)
                      .theme
                      .textTheme
                      .titleMedium!
                      .color,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
    );
  }
}

class _AuthButtonsWidget extends StatelessWidget {
  const _AuthButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 51),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButtonComponent(
            onPressed: () => {
              Navigator.of(context).pushNamed(MainNavigationRouteNames.login),
            },
            style: AdaptiveTheme.of(context).theme.elevatedButtonTheme.style,
            child: AppLocalizations.of(context)!.signIn,
          ),
          ElevatedButtonComponent(
            onPressed: () => {
              Navigator.of(context)
                  .pushNamed(MainNavigationRouteNames.register),
            },
            child: AppLocalizations.of(context)!.signUp,
          )
        ],
      ),
    );
  }
}
