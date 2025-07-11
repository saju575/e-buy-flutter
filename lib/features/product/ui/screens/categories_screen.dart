import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/circular_progress.dart';
import 'package:e_buy/app/widgets/global_loading.dart';
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
    final colors = context.colors;
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
            return GlobalLoading(
              isLoading:
                  categoryContext.initialLoading &&
                  categoryContext.list.isEmpty,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: RefreshIndicator(
                  onRefresh: categoryContext.refreshData,
                  backgroundColor: colors.primaryWeak,
                  color: colors.primary,
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount:
                        categoryContext.list.length +
                        (categoryContext.loadingMore ? 1 : 0),

                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      return index < categoryContext.list.length
                          ? FittedBox(
                              child: ProductCategory(
                                categoryModel: categoryContext.list[index],
                                onTap: () => _moveToSpecificCategoryProductList(
                                  categoryContext.list[index].id,
                                ),
                              ),
                            )
                          : const Center(child: CircularProgress());
                    },
                  ),
                ),
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
