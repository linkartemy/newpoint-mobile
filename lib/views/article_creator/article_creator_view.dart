import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:newpoint/components/button.dart';
import 'package:newpoint/components/error.dart';
import 'package:newpoint/components/markdown_text_input.dart';
import 'package:newpoint/components/simple_markdown_editor/simple_markdown_editor_plus.dart';
import 'package:newpoint/components/text_button.dart';
import 'package:newpoint/components/text_field.dart';
import 'package:newpoint/views/article_creator/article_creator_view_model.dart';
import 'package:newpoint/views/loader/loader_view.dart';
import 'package:newpoint/views/post_creator/post_creator_view_model.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCreatorView extends StatefulWidget {
  const ArticleCreatorView({Key? key}) : super(key: key);

  @override
  ArticleCreatorViewState createState() => ArticleCreatorViewState();
}

class ArticleCreatorViewState extends State<ArticleCreatorView> {
  bool _isLoading = false;

  Future<void> onRefresh() async {
    final model = Provider.of<ArticleCreatorViewModel>(context, listen: false);
    await model.getUser();
    setState(() {});
  }

  Future<void> getUser() async {
    final model = Provider.of<ArticleCreatorViewModel>(context, listen: false);
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

  Widget markdownPreviewWidget() {
    final model = Provider.of<ArticleCreatorViewModel>(context, listen: false);
    return Card(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 180),
        child: SingleChildScrollView(
          key: PageStorageKey<String>("markdown_preview"),
          controller: model.scrollController,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: MarkdownBody(
              data: model.inputText,
              shrinkWrap: true,
              softLineBreak: true,
              imageBuilder: (imageUri, _, alternateText) {
                return Image.network(
                  imageUri.toString(),
                  errorBuilder: (_, __, ___) {
                    return Text(alternateText ??
                        "AppLocalizations.of(context)!.imageAlternateTextFallback");
                  },
                );
              },
              onTapLink: (i, j, k) {
                launchUrl(Uri.parse(j ?? ""));
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget verticalView() {
    final model = Provider.of<ArticleCreatorViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 5),
      child: Column(
        children: [
          Expanded(
            child: markdownPreviewWidget(),
          ),
          const SizedBox(height: 5),
          MarkdownTextInput(
            (String value) => setState(() => model.inputText = value),
            model.inputText,
            controller: model.textFieldController,
            maxLines: 8,
            label: "AppLocalizations.of(context)!.markdownTextInputLabel",
          ),
        ],
      ),
    );
  }

  Widget hiddenView() {
    final model = Provider.of<ArticleCreatorViewModel>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        reverseDuration: const Duration(milliseconds: 300),
        child: (false)
            ? markdownPreviewWidget()
            : MarkdownTextInput(
                (String value) => setState(() => model.inputText = value),
                model.inputText,
                controller: model.textFieldController,
                label: "AppLocalizations.of(context)!.markdownTextInputLabel",
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ArticleCreatorViewModel>(context);

    return Scaffold(
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: TextButtonComponent(
                onPressed: () async {
                  if (_isLoading) return;
                  AlertDialog alert = AlertDialog(
                    actionsAlignment: MainAxisAlignment.start,
                    actionsOverflowAlignment: OverflowBarAlignment.center,
                    title: Text(
                      AppLocalizations.of(context)!.writeTitle,
                      textAlign: TextAlign.center,
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.titleLarge,
                    ),
                    content: TextFieldComponent(
                      controller: model.titleFieldController,
                      label: AppLocalizations.of(context)!.writeTitle,
                    ),
                    actions: [
                      TextButton(
                        child: Text(AppLocalizations.of(context)!.createArticle,
                            textAlign: TextAlign.center),
                        onPressed: () async {
                          Navigator.of(context).pop();
                          var id = await model.createArticle();
                          setState(() {});
                          if (model.textFieldError.isEmpty) {
                            Navigator.of(context).pop(id != -1 ? id : null);
                          } else {
                            AlertDialog alert = AlertDialog(
                              title: ErrorComponent(
                                error: model.textFieldError,
                              ),
                              actions: [
                                TextButton(
                                  child: Text(
                                    AppLocalizations.of(context)!.ok,
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          }
                        },
                      ),
                      TextButton(
                        child: Text(
                          AppLocalizations.of(context)!.cancel,
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    },
                  );
                },
                child: AppLocalizations.of(context)!.createArticle,
              ),
            ),
          ],
          title: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10),
              child: Text("${model.textFieldController.text.length}/10000",
                  style: AdaptiveTheme.of(context)
                      .theme
                      .textTheme
                      .bodyMedium!
                      .copyWith(
                          color: model.textFieldController.text.length > 10000
                              ? AppColors.errorColor
                              : AdaptiveTheme.of(context)
                                  .theme
                                  .colorScheme
                                  .secondary))),
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
                  : MarkdownFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: model.textFieldController,
                      enableToolBar: true,
                      emojiConvert: true,
                      autoCloseAfterSelectEmoji: false,
                      style:
                          AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
                      onTapLink: (text, href, title) {
                        launchUrl(Uri.parse(href ?? ""));
                      },
                    ),
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
