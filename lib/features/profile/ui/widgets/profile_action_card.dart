import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class ProfileActionCard extends StatelessWidget {
  const ProfileActionCard({
    super.key,
    this.onTap,
    this.iconName,
    required this.title,
  });
  final VoidCallback? onTap;
  final String? iconName;
  final String title;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 8),
        decoration: BoxDecoration(
          color: colors.primaryWeak,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            iconName != null
                ? AppIcon(iconName: iconName, color: colors.heading)
                : AppIcon(icon: Icons.list_alt, color: colors.heading),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: textStyle.base.copyWith(color: colors.heading),
              ),
            ),
            AppIcon(iconName: AppIcons.arrowForward, color: colors.grey),
          ],
        ),
      ),
    );
  }
}
