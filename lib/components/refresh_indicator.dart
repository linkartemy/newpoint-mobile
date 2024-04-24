import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class RefreshIndicatorComponent extends StatelessWidget {
  const RefreshIndicatorComponent(
      {Key? key,
      required this.child,
      required this.onRefresh,
      this.notificationPredicate})
      : super(key: key);

  final Widget child;
  final Future<void> Function() onRefresh;
  final ScrollNotificationPredicate? notificationPredicate;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AdaptiveTheme.of(context).theme.primaryColor,
      notificationPredicate:
          notificationPredicate ?? defaultScrollNotificationPredicate,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
