import 'package:flutter/material.dart';
import 'package:newpoint/views/theme/theme.dart';

class LoaderView extends StatelessWidget {
  const LoaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
