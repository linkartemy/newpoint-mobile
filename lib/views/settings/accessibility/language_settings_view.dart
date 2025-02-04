import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newpoint/components/error.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/settings/accessibility/language_settings_view_model.dart';
import 'package:provider/provider.dart';

class LanguageSettingsView extends StatefulWidget {
  const LanguageSettingsView({Key? key}) : super(key: key);

  @override
  LanguageSettingsViewState createState() => LanguageSettingsViewState();
}

class LanguageSettingsViewState extends State<LanguageSettingsView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model =
        Provider.of<LanguageSettingsViewModel>(context, listen: false);
    await getUser();
  }

  Future<void> getUser() async {
    final model =
        Provider.of<LanguageSettingsViewModel>(context, listen: false);
    await model.getUser();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> reload() async {
    setState(() {
      _isLoading = true;
    });
    getUser();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LanguageSettingsViewModel>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_rounded, size: 25),
          ),
        ),
        body: _isLoading
            ? const LoaderView()
            : Column(
                children: [_Body(), ErrorComponent(error: model.error)],
              ));
  }
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  Future<void> onDetailsTap() async {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LanguageSettingsViewModel>(context);

    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ));
  }
}
