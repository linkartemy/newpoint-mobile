import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
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
    final model = Provider.of<ProfileEditorViewModel>(context, listen: false);
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
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_rounded, size: 25),
          ),
          title: Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () async {
                  await model.updateProfile();
                  Navigator.of(context).pop(model.profile);
                },
                child: Text("Save"),
              )),
        ),
        body: RefreshIndicator(
            onRefresh: onRefresh,
            notificationPredicate: (ScrollNotification notification) {
              if (model.error.isNotEmpty ||
                  _isLoadingProfile ||
                  profile == null) return notification.depth == 0;
              return notification.depth == 1;
            },
            child: model.error.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 300, horizontal: 10),
                    child: Text(model.error,
                        style: AdaptiveTheme.of(context)
                            .theme
                            .textTheme
                            .bodyMedium))
                : _isLoadingProfile || profile == null
                    ? const LoaderView()
                    : _Editor()));
  }
}

class _Editor extends StatelessWidget {
  const _Editor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ProfileEditorViewModel>(context);

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
              Text(
                "Login",
                style: AdaptiveTheme.of(context).theme.textTheme.labelLarge,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputComponent(
                    controller: model.loginTextController, label: "Login"),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Name",
                  style: AdaptiveTheme.of(context).theme.textTheme.labelLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputComponent(
                    controller: model.nameTextController, label: "Name"),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Surname",
                  style: AdaptiveTheme.of(context).theme.textTheme.labelLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputComponent(
                    controller: model.surnameTextController, label: "Surname"),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Description",
                  style: AdaptiveTheme.of(context).theme.textTheme.labelLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputComponent(
                    controller: model.descriptionTextController,
                    label: "Tell about yourself"),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Location",
                  style: AdaptiveTheme.of(context).theme.textTheme.labelLarge),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: InputComponent(
                    controller: model.locationTextController,
                    label: "Where are you?"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
