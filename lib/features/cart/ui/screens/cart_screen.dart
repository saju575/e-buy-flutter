import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/global_loading.dart';
import 'package:e_buy/features/cart/ui/controllers/cart_controller.dart';
import 'package:e_buy/features/cart/ui/widgets/cart_item_card.dart';
import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:e_buy/middlewares/login_middleware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartController _cartItemsController = Get.find<CartController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cartItemsController.loadInitialData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        moveToHomeScreen();
      },
      child: Scaffold(
        appBar: MainLayoutAppBar(title: "Cart", onTapLeading: moveToHomeScreen),

        body: GetBuilder<CartController>(
          builder: (cartContext) {
            return GlobalLoading(
              isLoading: cartContext.loading,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: RefreshIndicator(
                        onRefresh: cartContext.refreshData,
                        backgroundColor: colors.primaryWeak,
                        color: colors.primary,
                        child: ListView.builder(
                          itemCount: cartContext.list.length,
                          itemBuilder: (context, index) {
                            return CartItemCard(item: cartContext.list[index]);
                          },
                        ),
                      ),
                    ),
                  ),
                  BottomPurchaseBar(
                    title: "Total Price",
                    price: cartContext.totalPrice,
                    buttonText: "Checkout",
                    onTapButton: _moveToShippingAddressScreen,
                    disabled: cartContext.list.isEmpty,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _moveToShippingAddressScreen() {
    if (_cartItemsController.list.isEmpty) return;
    guardRoute(
      context: context,
      onAllowed: () async {
        await Navigator.pushNamed(
          context,
          AppRoutes.shippingAddress,
          arguments: {"price": _cartItemsController.totalPrice.toString()},
        );
        await _cartItemsController.refreshData();
      },
    );
  }
}
