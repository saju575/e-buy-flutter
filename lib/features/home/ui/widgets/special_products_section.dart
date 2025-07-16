import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:e_buy/features/home/ui/widgets/section_header.dart';
import 'package:e_buy/features/shared/ui/widgets/product_card.dart';
import 'package:e_buy/features/wish_list/ui/controllers/wish_list_controller.dart';
import 'package:e_buy/utils/toast_util.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SpecialProductsSection extends StatelessWidget {
  SpecialProductsSection({super.key});

  static const int _LENGTH = 10;

  final WishListController _wishlistCController =
      Get.find<WishListController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpecialProductListController>(
      builder: (specialProductListContext) {
        return Visibility(
          visible: specialProductListContext.list.isNotEmpty,
          child: Column(
            children: [
              SectionHeader(
                title: "Special",
                onTap: () {
                  _moveToSpecialProductList(context);
                },
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _renderSpecialItems(context, specialProductListContext),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _renderSpecialItems(
    BuildContext context,
    SpecialProductListController specialProductListContext,
  ) {
    final lengthOfItemsToShow = specialProductListContext.list.length > _LENGTH
        ? _LENGTH
        : specialProductListContext.list.length;
    return SizedBox(
      height: 142,
      child: ListView.builder(
        itemCount: lengthOfItemsToShow,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index != lengthOfItemsToShow - 1 ? 16 : 4,
            ),
            child: FittedBox(
              child: ProductCard(
                product: specialProductListContext.list[index],
                width: 115,
                onTap: () => _moveToSpecificProduct(
                  context,
                  specialProductListContext.list[index].id,
                ),
                onFavTap: () {
                  _handleAddToWishList(
                    context,
                    specialProductListContext.list[index].id,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _moveToSpecificProduct(BuildContext context, String id) {
    Navigator.pushNamed(context, AppRoutes.productDetails, arguments: id);
  }

  void _moveToSpecialProductList(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.productList,
      arguments: {"tag": "special"},
    );
  }

  Future<void> _handleAddToWishList(BuildContext context, String id) async {
    final result = await _wishlistCController.addToWishlist(productId: id);
    if (!context.mounted) {
      return;
    }
    if (result) {
      ToastUtil.show(message: "Added to wishlist", context: context);
    } else {
      ToastUtil.show(
        message: _wishlistCController.addToWishlistErrorMessage,
        context: context,
      );
    }
  }
}
