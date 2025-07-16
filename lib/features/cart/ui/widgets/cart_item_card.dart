import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_model.dart';
import 'package:e_buy/features/cart/ui/controllers/cart_item_remove_controller.dart';
import 'package:e_buy/features/cart/ui/controllers/cart_items_controller.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({super.key, required this.item});
  final CartItemModel item;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  final CartItemsController _cartItemsController =
      Get.find<CartItemsController>();
  final CartItemRemoveController _cartItemRemoveController =
      Get.find<CartItemRemoveController>();
  late ValueNotifier<int> _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = ValueNotifier(widget.item.quantity);
  }

  @override
  void dispose() {
    _quantity.dispose();
    super.dispose();
  }

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
                            widget.item.product?.title ?? "",
                            style: textStyle.lg.copyWith(
                              color: colors.heading,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "color: ${widget.item.color ?? ""} Size: ${widget.item.size ?? ""}",
                            style: textStyle.sm.copyWith(
                              color: colors.bodyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _cartItemRemoveController.removeItem(widget.item.id);
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
                    ValueListenableBuilder(
                      valueListenable: _quantity,
                      builder: (context, value, child) {
                        return IncrementDecrement(
                          value: _quantity.value,
                          onTapDecrement: () {
                            if (_quantity.value > 1) {
                              _quantity.value--;
                              _cartItemsController.updateQuantity(
                                widget.item.id,
                                _quantity.value,
                              );
                              _cartItemsController.totalPrice();
                            }
                          },
                          onTapIncrement: () {
                            _quantity.value++;
                            _cartItemsController.updateQuantity(
                              widget.item.id,
                              _quantity.value,
                            );
                            _cartItemsController.totalPrice();
                          },
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
