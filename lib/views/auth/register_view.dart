import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newpoint/components/button.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/resources/resources.dart';
import 'package:newpoint/views/auth/register_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  Future<void> goBack() async {
    final model = context.read<RegisterViewModel>();
    await model.goBack();
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
          width: 100,
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
              child: Column(
                children: [
                  model.stage == 0
                      ? _FormWidget()
                      : (model.stage == 1
                          ? _EmailConfirmationWidget()
                          : _DataFormWidget()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        child: _AuthButtonWidget(
                          title: "Previous",
                          onPressed: () async {
                            await goBack();
                          },
                          activated: model.stage > 0,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: _AuthButtonWidget(
                          title: "Next",
                          onPressed: () async {
                            await proceed();
                          },
                          activated: true,
                        ),
                      )
                    ],
                  )
                ],
              ))
        ]),
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

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
            controller: model.passwordVerificationTextController,
            label: "Password verification",
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
      ],
    );
  }
}

class _EmailConfirmationWidget extends StatelessWidget {
  const _EmailConfirmationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegisterViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "We sent the code on your email",
          style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
        InputComponent(controller: model.codeTextController, label: "Code"),
        const SizedBox(height: 25),
        const _ErrorMessageWidget(),
      ],
    );
  }
}

class _DataFormWidget extends StatelessWidget {
  const _DataFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<RegisterViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: model.birthDateController,
          decoration: const InputDecoration(
            icon: Icon(CupertinoIcons.calendar),
            labelText: "Birth date",
            border: UnderlineInputBorder(),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1800),
                lastDate: DateTime(2100));

            if (pickedDate != null) {
              final formattedDate =
                  AppLocalizations.of(context)!.birthDate(pickedDate);
              model.birthDateController.text = formattedDate;
              model.birthDate = pickedDate;
            }
          },
        ),
        const SizedBox(height: 25),
        const _ErrorMessageWidget(),
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.activated})
      : super(key: key);

  final String title;
  final onPressed;
  final bool activated;

  @override
  Widget build(BuildContext context) {
    return activated
        ? ButtonComponent(
            onPressed: onPressed,
            child: Text(title),
          )
        : Container();
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
