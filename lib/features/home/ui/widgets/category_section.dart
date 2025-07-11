import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/home/ui/widgets/section_header.dart';
import 'package:e_buy/features/product/ui/controllers/category_controller.dart';
import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/features/shared/ui/widgets/product_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});
  static const int _LENGTH = 10;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(
      builder: (categoryContext) {
        return Visibility(
          visible: categoryContext.list.isNotEmpty,
          child: Column(
            children: [
              SectionHeader(title: "Categories", onTap: moveToCategoryScreen),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: _renderCategories(context, categoryContext),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _renderCategories(
    BuildContext context,
    CategoryController categoryContext,
  ) {
    final lengthOfItemsToShow = categoryContext.list.length > _LENGTH
        ? _LENGTH
        : categoryContext.list.length;
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: lengthOfItemsToShow,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index != lengthOfItemsToShow - 1 ? 16 : 4,
            ),
            child: FittedBox(
              child: ProductCategory(
                categoryModel: categoryContext.list[index],
                onTap: () => _moveToSpecificCategoryProductList(
                  context,
                  categoryContext.list[index].id,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _moveToSpecificCategoryProductList(
    BuildContext context,
    String category,
  ) {
    Navigator.pushNamed(
      context,
      AppRoutes.productList,
      arguments: {"category": category},
    );
  }
}
