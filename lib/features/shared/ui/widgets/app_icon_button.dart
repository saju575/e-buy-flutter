import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.icon,
    this.onTap,
    this.height = 16,
    this.width = 16,
    this.iconSize = 12,
  });
  final AppIcon? icon;
  final VoidCallback? onTap;
  final double height;
  final double width;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: colors.primary,
        ),
        width: width,
        height: height,

        child: Center(
          child:
              icon ??
              AppIcon(
                iconName: AppIcons.trash,
                color: colors.headingSecondary,
                size: iconSize,
              ),
        ),
      ),
    );
  }
}
