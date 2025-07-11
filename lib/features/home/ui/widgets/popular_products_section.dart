import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:e_buy/features/home/ui/widgets/section_header.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key});

  static const int _LENGTH = 10;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductListController>(
      builder: (popularProductListContext) {
        return Visibility(
          visible: popularProductListContext.list.isNotEmpty,
          child: Column(
            children: [
              SectionHeader(
                title: "Popular",
                onTap: () {
                  _moveToPopularProductList(context);
                },
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _renderPopularItems(context, popularProductListContext),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _renderPopularItems(
    BuildContext context,
    PopularProductListController popularProductListContext,
  ) {
    final lengthOfItemsToShow = popularProductListContext.list.length > _LENGTH
        ? _LENGTH
        : popularProductListContext.list.length;
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
                width: 115,
                onTap: () => _moveToSpecificProduct(context, "1"),
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

  void _moveToPopularProductList(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.productList,
      arguments: {"tag": "popular"},
    );
  }
}
