import 'package:e_buy/app/widgets/global_loading.dart';
import 'package:e_buy/features/cart/ui/controllers/cart_items_controller.dart';
import 'package:e_buy/features/cart/ui/widgets/cart_item_card.dart';
import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartItemsController _cartItemsController =
      Get.find<CartItemsController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartItemsController.loadInitialData();
      _cartItemsController.totalPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        moveToHomeScreen();
      },
      child: Scaffold(
        appBar: MainLayoutAppBar(title: "Cart", onTapLeading: moveToHomeScreen),

        body: GetBuilder<CartItemsController>(
          builder: (cartContext) {
            return GlobalLoading(
              isLoading: cartContext.loading,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: ListView.builder(
                        itemCount: cartContext.list.length,
                        itemBuilder: (context, index) {
                          return CartItemCard(item: cartContext.list[index]);
                        },
                      ),
                    ),
                  ),
                  GetBuilder<CartItemsController>(
                    builder: (cartItemContext) {
                      return BottomPurchaseBar(
                        title: "Total Price",
                        price: cartItemContext.total,
                        buttonText: "Checkout",
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
