import 'package:e_buy/features/cart/ui/widgets/cart_item_card.dart';
import 'package:e_buy/features/shared/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _moveToHomeScreen();
      },
      child: Scaffold(
        appBar: MainLayoutAppBar(
          title: "Cart",
          onTapLeading: _moveToHomeScreen,
        ),

        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return CartItemCard();
            },
          ),
        ),
        bottomNavigationBar: PriceFooter(
          title: "Total Price",
          price: 5000,
          buttonText: "Checkout",
        ),
      ),
    );
  }

  void _moveToHomeScreen() {
    Get.find<MainBottomNavController>().backToHome();
  }
}
