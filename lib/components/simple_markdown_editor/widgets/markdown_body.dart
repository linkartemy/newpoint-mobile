import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:newpoint/views/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownBodyComponent extends StatelessWidget {
  MarkdownBodyComponent({required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      selectable: true,
      data: content,
      styleSheet: MarkdownStyleSheet(
        h1: AdaptiveTheme.of(context).theme.textTheme.displaySmall,
        h2: AdaptiveTheme.of(context).theme.textTheme.titleLarge,
        h3: AdaptiveTheme.of(context).theme.textTheme.titleMedium,
        p: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
        blockquoteDecoration: BoxDecoration(
          color: AdaptiveTheme.of(context).theme.colorScheme.background,
          borderRadius: BorderRadius.circular(8),
        ),
        blockquote: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
        codeblockDecoration: BoxDecoration(
          color: AdaptiveTheme.of(context).darkTheme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        code: AdaptiveTheme.of(context).darkTheme.textTheme.bodyMedium!.copyWith(fontFamily: AppFonts.codeBlockFont, backgroundColor: AdaptiveTheme.of(context).darkTheme.scaffoldBackgroundColor),
        horizontalRuleDecoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AdaptiveTheme.of(context).theme.colorScheme.secondary,
              width: 1,
            ),
          ),
        ),
      ),
      onTapLink: (text, href, title) {
        if (href == null) return;
        launchUrl(Uri.parse(href));
      }
    );
  }
}
