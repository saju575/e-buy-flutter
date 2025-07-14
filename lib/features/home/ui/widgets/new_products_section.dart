import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:e_buy/features/home/ui/widgets/section_header.dart';
import 'package:e_buy/features/shared/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductsSection extends StatelessWidget {
  const NewProductsSection({super.key});
  static const int _LENGTH = 10;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewProductListController>(
      builder: (newProductsContext) {
        return Visibility(
          visible: newProductsContext.list.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(
                title: "New",
                onTap: () => _moveToNewProductList(context),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _renderNewItems(context, newProductsContext),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _renderNewItems(
    BuildContext context,
    NewProductListController newProductsContext,
  ) {
    final lengthOfItemsToShow = newProductsContext.list.length > _LENGTH
        ? _LENGTH
        : newProductsContext.list.length;
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
                onTap: () => _moveToSpecificProduct(
                  context,
                  newProductsContext.list[index].id,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _moveToNewProductList(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.productList,
      arguments: {"tag": "new"},
    );
  }

  void _moveToSpecificProduct(BuildContext context, String id) {
    Navigator.pushNamed(context, AppRoutes.productDetails, arguments: id);
  }
}
