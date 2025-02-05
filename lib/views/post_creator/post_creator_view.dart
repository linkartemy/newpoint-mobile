import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newpoint/components/button.dart';
import 'package:newpoint/components/text_field.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/post_creator/post_creator_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';

class PostCreatorView extends StatefulWidget {
  const PostCreatorView({Key? key}) : super(key: key);

  @override
  PostCreatorViewState createState() => PostCreatorViewState();
}

class PostCreatorViewState extends State<PostCreatorView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model = Provider.of<PostCreatorViewModel>(context, listen: false);
    await model.getUser();
    setState(() {});
  }

  Future<void> getUser() async {
    final model = Provider.of<PostCreatorViewModel>(context, listen: false);
    await model.getUser();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    getUser();
  }

  void onCommentTextChanged(String value) {}

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<PostCreatorViewModel>(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AlertDialog alert = AlertDialog(
                actionsAlignment: MainAxisAlignment.start,
                actionsOverflowAlignment: OverflowBarAlignment.center,
                title: Text(
                  AppLocalizations.of(context)!.areYouSure,
                  textAlign: TextAlign.center,
                  style: AdaptiveTheme.of(context).theme.textTheme.titleLarge,
                ),
                actions: [
                  TextButton(
                    child: Text(AppLocalizations.of(context)!.yes,
                        textAlign: TextAlign.center),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.cancel,
                        textAlign: TextAlign.center,
                      )),
                ],
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            },
            child: const Icon(Icons.arrow_back_rounded, size: 25),
          ),
          title: const Text(""),
        ),
        body: RefreshIndicator(
          onRefresh: onRefresh,
          notificationPredicate: (ScrollNotification notification) {
            if (model.error.isNotEmpty || _isLoading || model.user == null) {
              return notification.depth == 0;
            }
            return notification.depth == 1;
          },
          child: model.error.isNotEmpty
              ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(model.error,
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.bodyMedium))
              : _isLoading || model.user == null
                  ? const LoaderView()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                          TextFieldComponent(
                            label: AppLocalizations.of(context)!
                                .wordsHaveAGreatPower,
                            controller: model.textFieldController,
                            maxHeight: 300,
                            onChanged: (String value) {
                              setState(() {});
                            },
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                  "${model.textFieldController.text.length}/255",
                                  style: AdaptiveTheme.of(context)
                                      .theme
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: model.textFieldController.text
                                                      .length >
                                                  255
                                              ? AppColors.errorColor
                                              : AdaptiveTheme.of(context)
                                                  .theme
                                                  .colorScheme
                                                  .secondary))),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 10),
                            width: 100,
                            child: ButtonComponent(
                                onPressed: () async {
                                  var id = await model.createPost();
                                  setState(() {});
                                  if (model.textFieldError.isEmpty &&
                                      model.error.isEmpty) {
                                    Navigator.of(context)
                                        .pop(id != -1 ? id : null);
                                  }
                                },
                                child: Text(
                                    AppLocalizations.of(context)!.createPost)),
                          ),
                          const SizedBox(height: 25),
                          _ErrorMessageWidget(
                            error: model.textFieldError,
                          ),
                        ]),
        ));
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    if (error.isEmpty) return const SizedBox.shrink();

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        error,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.red,
        ),
      ),
    );
  }
}
