import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
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
        body: OverflowBox(
            maxHeight: double.infinity,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: RichText(
                    text: TextSpan(
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.titleMedium,
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Welcome back!\nGlad to see ',
                        ),
                        TextSpan(
                            text: 'You',
                            style: TextStyle(
                                color: AdaptiveTheme.of(context)
                                    .theme
                                    .primaryColor)),
                        const TextSpan(
                          text: ', again!',
                        ),
                      ],
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
                  child: const _FormWidget())
            ])));
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
        InputComponent(controller: model.loginTextController, label: "Login"),
        const SizedBox(height: 21),
        InputComponent(
            controller: model.passwordTextController,
            label: "Password",
            obscureText: true),
        const SizedBox(height: 25),
        ErrorComponent(error: context.select((LoginViewModel m) => m.errorMessage)),
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
        : const Text('Next');
    return ButtonComponent(
      onPressed: onPressed,
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((LoginViewModel m) => m.errorMessage);
    if (errorMessage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}
