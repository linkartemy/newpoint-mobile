import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/components/button.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/resources/resources.dart';
import 'package:newpoint/views/auth/register_view_model.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  Future<void> proceed() async {
    final model = context.read<RegisterViewModel>();
    await model.auth(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegisterViewModel>();

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
          width: 50,
        ),
      ),
      body: OverflowBox(
        maxHeight: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: RichText(
                text: TextSpan(
                  style: AdaptiveTheme.of(context).theme.textTheme.titleMedium,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Create a',
                    ),
                    TextSpan(
                        text: ' new ',
                        style: TextStyle(
                            color:
                                AdaptiveTheme.of(context).theme.primaryColor)),
                    const TextSpan(
                      text: 'account',
                    ),
                  ],
                ),
              )),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
              child: model.stage == 0
                  ? _FormWidget(
                      onPressed: () async {
                        await proceed();
                      },
                    )
                  : (model.stage == 1
                      ? _EmailConfirmationWidget(
                          onPressed: () async {
                            await proceed();
                          },
                        )
                      : _EmailConfirmationWidget(
                          onPressed: () async {
                            await proceed();
                          },
                        )))
        ]),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key, required this.onPressed}) : super(key: key);

  final onPressed;
  @override
  Widget build(BuildContext context) {
    final model = context.read<RegisterViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputComponent(controller: model.loginTextController, label: "Login"),
        const SizedBox(height: 10),
        InputComponent(
            controller: model.passwordTextController,
            label: "Password",
            obscureText: true),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.nameTextController,
          label: "Name",
        ),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.surnameTextController,
          label: "Surname",
        ),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.emailTextController,
          label: "Email",
        ),
        const SizedBox(height: 25),
        const _ErrorMessageWidget(),
        Container(
          alignment: Alignment.bottomRight,
          child: _AuthButtonWidget(onPressed: onPressed),
        )
      ],
    );
  }
}

class _EmailConfirmationWidget extends StatelessWidget {
  const _EmailConfirmationWidget({Key? key, required this.onPressed})
      : super(key: key);

  final onPressed;
  @override
  Widget build(BuildContext context) {
    final model = context.read<RegisterViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputComponent(controller: model.loginTextController, label: "Login"),
        const SizedBox(height: 10),
        InputComponent(
            controller: model.passwordTextController,
            label: "Password",
            obscureText: true),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.nameTextController,
          label: "Name",
        ),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.surnameTextController,
          label: "Surname",
        ),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.emailTextController,
          label: "Email",
        ),
        const SizedBox(height: 25),
        const _ErrorMessageWidget(),
        Container(
          alignment: Alignment.bottomRight,
          child: _AuthButtonWidget(
            onPressed: onPressed,
          ),
        )
      ],
    );
  }
}

class _DataFormWidget extends StatelessWidget {
  const _DataFormWidget({Key? key, required this.onPressed}) : super(key: key);

  final onPressed;
  @override
  Widget build(BuildContext context) {
    final model = context.read<RegisterViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InputComponent(controller: model.loginTextController, label: "Login"),
        const SizedBox(height: 10),
        InputComponent(
            controller: model.passwordTextController,
            label: "Password",
            obscureText: true),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.nameTextController,
          label: "Name",
        ),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.surnameTextController,
          label: "Surname",
        ),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.emailTextController,
          label: "Email",
        ),
        const SizedBox(height: 25),
        const _ErrorMessageWidget(),
        Container(
          alignment: Alignment.bottomRight,
          child: _AuthButtonWidget(
            onPressed: onPressed,
          ),
        )
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key, required this.onPressed})
      : super(key: key);

  final onPressed;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<RegisterViewModel>();
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
    final errorMessage =
        context.select((RegisterViewModel m) => m.errorMessage);
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
