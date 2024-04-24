import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/button.dart';
import 'package:newpoint/components/elevated_button.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/components/text_button.dart';
import 'package:newpoint/resources/resources.dart';
import 'package:newpoint/views/auth/register_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
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

  Future<void> goBack() async {
    final model = context.read<RegisterViewModel>();
    await model.goBack();
    setState(() {});
  }

  Future<void> resendCode() async {
    final model = context.read<RegisterViewModel>();
    if (!model.resendCodeButtonAvailable) return;
    model.resendCodeButtonAvailable = false;
    setState(() {});
    await model.resendCode();
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
            AdaptiveTheme.of(context).mode.isLight
                ? AppImages.logoTitle
                : AppImages.logoTitleDark,
            width: 100,
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom / 2),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: RichText(
                        text: TextSpan(
                          style: AdaptiveTheme.of(context)
                              .theme
                              .textTheme
                              .titleMedium,
                          children: <TextSpan>[
                            TextSpan(
                              text: AppLocalizations.of(context)!.createA,
                            ),
                            TextSpan(
                                text:
                                    ' ${AppLocalizations.of(context)!.newBlue} ',
                                style: TextStyle(
                                    color: AdaptiveTheme.of(context)
                                        .theme
                                        .primaryColor)),
                            TextSpan(
                              text: AppLocalizations.of(context)!.account,
                            ),
                          ],
                        ),
                      )),
                  Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 70),
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
                                  title: AppLocalizations.of(context)!.previous,
                                  onPressed: () async {
                                    await goBack();
                                  },
                                  activated: model.stage > 0,
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: _AuthButtonWidget(
                                  title: AppLocalizations.of(context)!.next,
                                  onPressed: () async {
                                    if (!model.proceedAvailable) {
                                      return;
                                    }
                                    model.proceedAvailable = false;
                                    await proceed();
                                    setState(() {});
                                    Future.delayed(const Duration(seconds: 1),
                                        () {
                                      model.proceedAvailable = true;
                                      setState(() {});
                                    });
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
        )));
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
        InputComponent(
            controller: model.loginTextController,
            label: AppLocalizations.of(context)!.login),
        const SizedBox(height: 10),
        InputComponent(
            controller: model.passwordTextController,
            label: AppLocalizations.of(context)!.password,
            obscureText: true),
        const SizedBox(height: 10),
        InputComponent(
            controller: model.passwordVerificationTextController,
            label: AppLocalizations.of(context)!.passwordConfirmation,
            obscureText: true),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.nameTextController,
          label: AppLocalizations.of(context)!.name,
        ),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.surnameTextController,
          label: AppLocalizations.of(context)!.surname,
        ),
        const SizedBox(height: 10),
        InputComponent(
          controller: model.emailTextController,
          label: AppLocalizations.of(context)!.email,
        ),
        const SizedBox(height: 25),
        const _ErrorMessageWidget(),
      ],
    );
  }
}

class _EmailConfirmationWidget extends StatefulWidget {
  const _EmailConfirmationWidget({Key? key}) : super(key: key);

  @override
  _EmailConfirmationWidgetState createState() =>
      _EmailConfirmationWidgetState();
}

class _EmailConfirmationWidgetState extends State<_EmailConfirmationWidget> {
  @override
  Widget build(BuildContext context) {
    final model = context.read<RegisterViewModel>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.sentCode,
          style: AdaptiveTheme.of(context).theme.textTheme.titleSmall,
        ),
        const SizedBox(height: 10),
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
          decoration: InputDecoration(
            icon: Icon(CupertinoIcons.calendar),
            labelText: AppLocalizations.of(context)!.birthDateString,
            border: UnderlineInputBorder(),
          ),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1800),
                lastDate: DateTime.now());

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
    final model = context.read<RegisterViewModel>();

    return activated
        ? ElevatedButtonComponent(
            onPressed: onPressed,
            child: title,
            available: model.proceedAvailable,
          )
        : Container();
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((RegisterViewModel m) => m.error);
    if (errorMessage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 17,
          color: AppColors.errorColor,
        ),
      ),
    );
  }
}
