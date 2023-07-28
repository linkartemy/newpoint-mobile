import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/button.dart';
import 'package:newpoint/components/textButton.dart';
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
        AppImages.logoTitle,
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
      child: Text(
          "The best place for writers and readers from all over the world ",
          style: AdaptiveTheme.of(context)
              .theme
              .textTheme
              .titleMedium
              ?.copyWith(
                  color: Colors.black,
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
          ButtonComponent(
            onPressed: () => {
              Navigator.of(context).pushNamed(MainNavigationRouteNames.login),
            },
            style: AdaptiveTheme.of(context).theme.elevatedButtonTheme.style,
            child: const Text("Sign in"),
          ),
          TextButtonComponent(
            onPressed: () => {
              Navigator.of(context)
                  .pushNamed(MainNavigationRouteNames.register),
            },
            child: "Sign up",
          )
        ],
      ),
    );
  }
}
