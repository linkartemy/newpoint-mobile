import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:newpoint/views/theme/theme.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.navigationRoute,
  }) : super(key: key);
  final String title;
  final String description;
  final IconData icon;
  final String navigationRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        width: MediaQuery.of(context).size.width * 0.8,
        child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(navigationRoute);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            icon,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(title,
                              style: AdaptiveTheme.of(context)
                                  .theme
                                  .textTheme
                                  .titleSmall)
                        ]),
                    SizedBox(height: 4),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.64,
                        child: Text(description,
                            style: AdaptiveTheme.of(context)
                                .theme
                                .textTheme
                                .bodySmall))
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.secondaryTextColor,
                )
              ],
            )));
  }
}
