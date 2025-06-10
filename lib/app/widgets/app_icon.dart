import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon extends StatelessWidget {
  final IconData? icon;
  final String? iconName;
  final double size;
  final Color? color;
  final String? semanticLabel;
  final TextDirection? textDirection;

  const AppIcon({
    super.key,
    this.icon,
    this.iconName,
    this.size = 24.0,
    this.color,
    this.semanticLabel,
    this.textDirection,
  }) : assert(
         icon != null || iconName != null,
         'Either icon or iconName must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final defaultColor = color ?? context.colors.heading;
    if (icon != null) {
      return Icon(
        icon,
        size: size,
        color: defaultColor,
        semanticLabel: semanticLabel,
        textDirection: textDirection,
      );
    } else {
      final svgIcon = SvgPicture.asset(
        iconName!,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(defaultColor, BlendMode.srcIn),
        semanticsLabel: semanticLabel,
      );

      return textDirection != null
          ? Directionality(textDirection: textDirection!, child: svgIcon)
          : svgIcon;
    }
  }
}
