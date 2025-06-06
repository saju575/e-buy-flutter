import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key, required this.onTap, required this.iconName});
  final VoidCallback onTap;
  final String iconName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),

        child: AppIcon(
          iconName: iconName,
          size: 24,
          color: context.colors.bodyText,
        ),
      ),
    );
  }
}
