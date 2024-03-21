import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({Key? key, required this.error}) : super(key: key);

  final String? error;

  @override
  Widget build(BuildContext context) {
    if (error == null) return const SizedBox.shrink();
    if (error!.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        error ?? "",
        style: AdaptiveTheme.of(context).theme.textTheme.bodySmall!.copyWith(
              fontSize: 14,
              color: Colors.red,
            ),
      ),
    );
  }
}
