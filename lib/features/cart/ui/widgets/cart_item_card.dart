import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_model.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.item});
  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Container(
      decoration: BoxDecoration(
        color: colors.primaryWeak,
        borderRadius: BorderRadius.circular(6),
      ),
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Image.asset(AssetPaths.shoe, fit: BoxFit.cover),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            item.product?.title ?? "",
                            style: textStyle.lg.copyWith(
                              color: colors.heading,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "color: ${item.color ?? ""} Size: ${item.size ?? ""}",
                            style: textStyle.sm.copyWith(
                              color: colors.bodyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      child: AppIcon(
                        iconName: AppIcons.trash,
                        color: colors.bodyText,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Rs ${item.product?.currentPrice}",
                      style: textStyle.lg.copyWith(color: colors.primary),
                    ),
                    IncrementDecrement(
                      value: 01,
                      onTapDecrement: () {},
                      onTapIncrement: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
