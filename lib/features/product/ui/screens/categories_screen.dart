import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/safe_grid_view.dart';
import 'package:e_buy/features/product/ui/controllers/category_controller.dart';
import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final ScrollController _scrollController = ScrollController();
  final CategoryController _categoryController = Get.find<CategoryController>();

  @override
  void initState() {
    super.initState();

    // _categoryController.loadInitialData();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          title: "Categories",
          onTapLeading: moveToHomeScreen,
        ),
        body: GetBuilder<CategoryController>(
          builder: (categoryContext) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

              child: SafeGridView(
                scrollController: _scrollController,
                items: categoryContext.list,
                isLoading: categoryContext.initialLoading,
                isLoadingMore: categoryContext.loadingMore,
                onRefresh: categoryContext.refreshData,
                onRetry: categoryContext.refreshData,
                emptyMessage: "No categories found",
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 80,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, item, index) {
                  return FittedBox(
                    child: ProductCategory(
                      categoryModel: item,
                      onTap: () => _moveToSpecificCategoryProductList(item.id),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        _categoryController.hasNextPage &&
        !_categoryController.loadingMore) {
      _categoryController.loadMore();
    }
  }

  void _moveToSpecificCategoryProductList(String category) {
    Navigator.pushNamed(
      context,
      AppRoutes.productList,
      arguments: {"category": category},
    );
  }
}
