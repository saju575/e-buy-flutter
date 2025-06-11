import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, this.width, this.onTap});
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 130,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: colors.primaryWeak,
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors.primaryWeak,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Image.asset(
                  AssetPaths.shoe,
                  height: 65,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              "New Year Special Shoe 30",
              style: textStyle.base.copyWith(color: colors.bodyText),
              maxLines: 1,
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "100",
                  style: textStyle.lg.copyWith(color: colors.primary),
                  maxLines: 1,
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppIcon(
                      iconName: AppIcons.star,
                      color: colors.warning,
                      size: 12,
                    ),
                    SizedBox(width: 2),
                    Text(
                      "4.8",
                      style: textStyle.sm.copyWith(color: colors.bodyText),
                      maxLines: 1,
                    ),
                  ],
                ),
                const AppIconButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
