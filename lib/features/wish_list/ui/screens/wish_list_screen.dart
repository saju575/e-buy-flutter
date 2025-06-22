import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        moveToHomeScreen();
      },
      child: Scaffold(
        appBar: MainLayoutAppBar(
          title: "Wish List",
          onTapLeading: moveToHomeScreen,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: GridView.builder(
            itemCount: 100,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 136,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) => FittedBox(child: ProductCard()),
          ),
        ),
      ),
    );
  }
}
