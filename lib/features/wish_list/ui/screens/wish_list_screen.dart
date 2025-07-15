import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/global_loading.dart';
import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:e_buy/features/wish_list/ui/controllers/wish_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListController _wishListController = Get.find<WishListController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _wishListController.loadInitialData();
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
        appBar: MainLayoutAppBar(
          title: "Wish List",
          onTapLeading: moveToHomeScreen,
        ),
        body: GetBuilder<WishListController>(
          builder: (wishListContext) {
            return GlobalLoading(
              isLoading: wishListContext.loading,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: GridView.builder(
                  itemCount: wishListContext.list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisExtent: 136,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4,
                  ),
                  itemBuilder: (context, index) => FittedBox(
                    child: ProductCard(
                      product: wishListContext.list[index].product,
                      onTap: () => _moveToSpecificProduct(
                        wishListContext.list[index].id,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _moveToSpecificProduct(String id) {
    Navigator.pushNamed(context, AppRoutes.productDetails, arguments: id);
  }
}
