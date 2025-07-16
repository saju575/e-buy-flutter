import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:e_buy/utils/empty_placeholder.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.width,
    this.onTap,
    this.onFavTap,
    this.onRemoveTap,
    this.isFromWishlist = false,
  });
  final double? width;
  final VoidCallback? onTap;
  final ProductModel product;
  final VoidCallback? onFavTap;
  final VoidCallback? onRemoveTap;
  final bool isFromWishlist;

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Image.network(
                  (product.photos != null && product.photos!.isNotEmpty)
                      ? product.photos![0]
                      : EmptyPlaceholder.image,
                  height: 65,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              product.title ?? "",
              style: textStyle.base.copyWith(color: colors.bodyText),
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            Text(
              "Rs ${product.currentPrice}",
              style: textStyle.lg.copyWith(color: colors.primary),
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                AppIconButton(
                  onTap: isFromWishlist ? onRemoveTap : onFavTap,
                  icon: AppIcon(
                    icon: isFromWishlist
                        ? Icons.delete
                        : Icons.favorite_outline_rounded,
                    color: colors.bodyText,
                    size: 18,
                  ),
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
