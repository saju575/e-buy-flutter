import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:e_buy/features/home/ui/widgets/section_header.dart';
import 'package:e_buy/features/shared/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewProductsSection extends StatelessWidget {
  const NewProductsSection({super.key});
  static const int _CATEGORY_LENGTH = 10;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewProductListController>(
      builder: (newProductsContext) {
        print("New products ${newProductsContext.list.length}");
        return Visibility(
          visible: newProductsContext.list.isNotEmpty,
          child: Expanded(
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
          ),
        );
      },
    );
  }

  Widget _renderNewItems(
    BuildContext context,
    NewProductListController newProductListContext,
  ) {
    return SizedBox(
      height: 142,
      child: ListView.builder(
        itemCount: newProductListContext.list.length > _CATEGORY_LENGTH
            ? _CATEGORY_LENGTH
            : newProductListContext.list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index != _CATEGORY_LENGTH - 1 ? 16 : 0,
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

  void _moveToNewProductList(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productList, arguments: "New");
  }

  void _moveToSpecificProduct(BuildContext context, String id) {
    Navigator.pushNamed(context, AppRoutes.productDetails, arguments: id);
  }
}
