import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownBodyComponent extends StatelessWidget {
  MarkdownBodyComponent({required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: content,
      styleSheet: MarkdownStyleSheet(
        h1: AdaptiveTheme.of(context).theme.textTheme.displaySmall,
        h2: AdaptiveTheme.of(context).theme.textTheme.titleLarge,
        h3: AdaptiveTheme.of(context).theme.textTheme.titleMedium,
        p: AdaptiveTheme.of(context).theme.textTheme.bodyMedium,
      ),
      onTapLink: (text, href, title) {
        if (href == null) return;
        launchUrl(Uri.parse(href));
      }
    );
  }
}
