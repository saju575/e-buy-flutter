import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/safe_grid_view.dart';
import 'package:e_buy/features/product/ui/controllers/product_list_controller.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:e_buy/features/wish_list/ui/controllers/wish_list_controller.dart';
import 'package:e_buy/middlewares/login_middleware.dart';
import 'package:e_buy/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.tag, this.category});
  static const name = "product-list";
  final String? category;
  final String? tag;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController _productListController =
      Get.find<ProductListController>();
  final WishListController _wishlistController = Get.find<WishListController>();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _productListController.loadInitialData(widget.tag, widget.category);
    _scrollController.addListener(_handleScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tag != null ? widget.tag! : "Product List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: GetBuilder<ProductListController>(
          builder: (productListContext) {
            return SafeGridView(
              scrollController: _scrollController,
              items: productListContext.list,
              isLoading: productListContext.initialLoading,
              isLoadingMore: productListContext.loadingMore,
              onRefresh: productListContext.refreshData,
              emptyMessage: "No products found",
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 136,
                mainAxisSpacing: 8,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, item, index) => FittedBox(
                child: ProductCard(
                  product: item,
                  onTap: () => _moveToSpecificProduct(item.id),
                  onFavTap: () {
                    _handleAddToWishList(context, item.id);
                  },
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

  void _handleScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        _productListController.hasNextPage &&
        !_productListController.loadingMore) {
      _productListController.loadMore();
    }
  }

  Future<void> _handleAddToWishList(BuildContext context, String id) async {
    guardRoute(
      context: context,
      onAllowed: () async {
        final result = await _wishlistController.addToWishlist(productId: id);
        if (!context.mounted) {
          return;
        }
        if (result) {
          ToastUtil.show(message: "Added to wishlist", context: context);
        } else {
          ToastUtil.show(
            message: _wishlistController.addToWishlistErrorMessage,
            context: context,
          );
        }
      },
      fallbackArguments: {"goBack": true},
    );
  }
}
