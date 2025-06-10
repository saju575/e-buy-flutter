import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final colors = context.colors;
    return TextField(
      textInputAction: TextInputAction.search,
      style: textStyle.base.copyWith(color: colors.heading),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppIcon(iconName: AppIcons.search, size: 24),
        ),
        prefixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 24),

        hintText: "Search",
      ),
    );
  }
}
