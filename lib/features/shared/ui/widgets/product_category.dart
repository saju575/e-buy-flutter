import 'package:e_buy/app/assets/asset_categories.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({
    super.key,
    required this.title,
    this.iconName,
    this.onTap,
  });
  final String? iconName;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colors.primaryWeak,
            ),
            child: Center(
              child: AppIcon(
                iconName: AssetCategories.food,
                color: colors.primary,
                size: 40,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: textStyle.base.copyWith(
              color: colors.bodyText,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
