import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: GridView.builder(
            itemCount: 100,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 100,
              mainAxisSpacing: 8,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) => FittedBox(
              child: ProductCategory(
                title: "Food",
                onTap: () => _moveToSpecificCategoryProductList("Food"),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _moveToSpecificCategoryProductList(String category) {
    Navigator.pushNamed(context, AppRoutes.productList, arguments: category);
  }
}
