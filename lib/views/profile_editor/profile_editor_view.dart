import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/error.dart';
import 'package:newpoint/components/input.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/profile_editor/profile_editor_view_model.dart';
import 'package:provider/provider.dart';

class ProfileEditorView extends StatefulWidget {
  const ProfileEditorView({Key? key}) : super(key: key);

  @override
  ProfileEditorViewState createState() => ProfileEditorViewState();
}

class ProfileEditorViewState extends State<ProfileEditorView> {
  bool _isLoadingProfile = false;

  Future<void> onRefresh() async {
    await getUser();
    await getProfile();
  }

  Future<void> getProfile() async {
    final model = Provider.of<ProfileEditorViewModel>(context, listen: false);
    await model.getProfile();
    setState(() {
      _isLoadingProfile = false;
    });
  }

  Future<void> getUser() async {
    final model = Provider.of<ProfileEditorViewModel>(context, listen: false);
    await model.getUser();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoadingProfile = true;
    });
    getUser();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileEditorViewModel>(context);
    var profile = model.profile;

    return Scaffold(
        appBar: AppBar(
          leading: Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () async {
                  Navigator.of(context).pop(model.profile);
                },
                child: Text(
                  AppLocalizations.of(context)!.cancel,
                  style: AdaptiveTheme.of(context).theme.textTheme.titleSmall
                ),
              )),
          leadingWidth: 100,
          title: Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (await model.updateProfile()) {
                    Navigator.of(context).pop(model.profile);
                  }
                  setState(() {});
                },
                child: Text(AppLocalizations.of(context)!.save,
                    style: AdaptiveTheme.of(context).theme.textTheme.titleSmall),
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: _isLoadingProfile || profile == null
                    ? const LoaderView()
                    : Column(children: [
                        const _Editor(),
                        ErrorComponent(
                          error: model.error,
                        )
                      ]))));
  }
}

class _Editor extends StatelessWidget {
  const _Editor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileEditorViewModel>(context);
    model.setBirthDate(context, model.profile!.birthDate!);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.name,
                  style: AdaptiveTheme.of(context).theme.textTheme.labelLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputComponent(
                  controller: model.nameTextController,
                  label: AppLocalizations.of(context)!.name,
                  textFieldStyle: AdaptiveTheme.of(context)
                      .theme
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.normal),
                  fillColor: Colors.transparent,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  isCollapsed: true,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.surname,
                  style: AdaptiveTheme.of(context).theme.textTheme.labelLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputComponent(
                    controller: model.surnameTextController,
                    label: AppLocalizations.of(context)!.surname,
                    textFieldStyle: AdaptiveTheme.of(context)
                        .theme
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.normal),
                    fillColor: Colors.transparent,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isCollapsed: true),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.description,
                  style: AdaptiveTheme.of(context).theme.textTheme.labelLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputComponent(
                    controller: model.descriptionTextController,
                    label: AppLocalizations.of(context)!.tellAboutYourself,
                    textFieldStyle: AdaptiveTheme.of(context)
                        .theme
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.normal),
                    fillColor: Colors.transparent,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isCollapsed: true),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.location,
                  style: AdaptiveTheme.of(context).theme.textTheme.labelLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputComponent(
                    controller: model.locationTextController,
                    label: AppLocalizations.of(context)!.whereAreYou,
                    textFieldStyle: AdaptiveTheme.of(context)
                        .theme
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.normal),
                    fillColor: Colors.transparent,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    isCollapsed: true),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.birthDateString,
                  style: AdaptiveTheme.of(context).theme.textTheme.labelLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller: model.birthDateController,
                  style: AdaptiveTheme.of(context)
                      .theme
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.normal),
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.birthDateString,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle:
                          AdaptiveTheme.of(context).theme.textTheme.bodySmall,
                      isCollapsed: true),
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
