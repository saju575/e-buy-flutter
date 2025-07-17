import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/app/widgets/increment_decrement_button.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_model.dart';
import 'package:e_buy/features/cart/ui/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({super.key, required this.item});
  final CartItemModel item;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  final CartController _cartItemsController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final image =
        widget.item.product?.photos != null &&
            widget.item.product!.photos!.isNotEmpty
        ? widget.item.product!.photos!.first
        : "";

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
            height: 90,
            child: Image.network(
              image,
              fit: BoxFit.scaleDown,
              errorBuilder: (context, error, stackTrace) => Center(
                child: Icon(
                  Icons.error_outline,
                  color: colors.bodyText,
                  size: 40,
                ),
              ),
            ),
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
                            widget.item.product?.title ?? "",
                            style: textStyle.lg.copyWith(
                              color: colors.heading,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 4),

                          Text(
                            [
                              if (widget.item.color != null)
                                'color: ${widget.item.color}',
                              if (widget.item.size != null)
                                'Size: ${widget.item.size}',
                            ].join(' '),
                            style: textStyle.sm.copyWith(
                              color: colors.bodyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _cartItemsController.remove(widget.item.id);
                      },
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
                      "Rs ${widget.item.product?.currentPrice}",
                      style: textStyle.lg.copyWith(color: colors.primary),
                    ),

                    IncrementDecrementButton(
                      value: widget.item.quantity,
                      onChange: (value) {
                        _cartItemsController.updateQuantity(
                          widget.item.id,
                          value,
                        );
                      },
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
