import 'package:e_buy/features/cart/ui/widgets/cart_item_card.dart';
import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

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
        moveToHomeScreen();
      },
      child: Scaffold(
        appBar: MainLayoutAppBar(title: "Cart", onTapLeading: moveToHomeScreen),

        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CartItemCard();
                  },
                ),
              ),
            ),
            BottomPurchaseBar(
              title: "Total Price",
              price: 5000,
              buttonText: "Checkout",
            ),
          ],
        ),
      ),
    );
  }
}
