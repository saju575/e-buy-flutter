import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/home/ui/widgets/app_bar_icon.dart';
import 'package:e_buy/features/home/ui/widgets/product_search_bar.dart';
import 'package:e_buy/features/home/ui/widgets/slider_card.dart';
import 'package:e_buy/features/shared/ui/controllers/actions/jump_action.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      appBar: _renderAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ProductSearchBar(),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppCarouselSlider<int>(
                indicatorColor: colors.primaryWeak,
                indicatorActiveColor: colors.primary,
                items: [1, 2, 3, 4, 5],
                sliderCardBuilder: (width, height, index, item) =>
                    SliderCard(width: width, height: height),
              ),
            ),
            const SizedBox(height: 12),
            _renderHeader(
              context: context,
              title: "Categories",
              onTap: moveToCategoryScreen,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(children: [_renderCategories()]),
            ),
            SizedBox(height: 12),
            _renderHeader(
              context: context,
              title: "Popular",
              onTap: _moveToPopularProductList,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: _renderPopularItems(),
            ),
            const SizedBox(height: 12),
            _renderHeader(
              context: context,
              title: "Special",
              onTap: _moveToSpecialProductList,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: _renderSpecialItems(),
            ),
            const SizedBox(height: 12),
            _renderHeader(
              context: context,
              title: "New",
              onTap: _moveToNewProductList,
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: _renderNewItems(),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  AppBar _renderAppBar() {
    return AppBar(
      title: AppIcon(iconName: AssetPaths.appLogoSvg, size: 28),
      actions: [
        AppBarIcon(iconName: AppIcons.bell, onTap: () {}),
        AppBarIcon(iconName: AppIcons.user, onTap: _moveToProfileScreen),
      ],
      centerTitle: false,
    );
  }

  Widget _renderHeader({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            maxLines: 1,
            style: textStyle.xl.copyWith(
              color: colors.heading,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              "See All",
              maxLines: 1,
              style: textStyle.base.copyWith(color: colors.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderCategories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index != 7 ? 16 : 0),
            // TODO:: Need to update
            child: FittedBox(
              child: ProductCategory(
                title: "Food",
                onTap: () => _moveToSpecificCategoryProductList("Food"),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _renderPopularItems() {
    return SizedBox(
      height: 142,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index != 7 ? 16 : 0),
            child: FittedBox(
              child: ProductCard(
                width: 115,
                onTap: () => _moveToSpecificProduct("1"),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _renderSpecialItems() {
    return SizedBox(
      height: 142,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index != 7 ? 16 : 0),
            child: FittedBox(
              child: ProductCard(
                width: 115,
                onTap: () => _moveToSpecificProduct("1"),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _renderNewItems() {
    return SizedBox(
      height: 142,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index != 7 ? 16 : 0),
            child: FittedBox(
              child: ProductCard(
                width: 115,
                onTap: () => _moveToSpecificProduct("1"),
              ),
            ),
          );
        },
      ),
    );
  }

  void _moveToPopularProductList() {
    Navigator.pushNamed(context, AppRoutes.productList, arguments: "Popular");
  }

  void _moveToSpecialProductList() {
    Navigator.pushNamed(context, AppRoutes.productList, arguments: "Special");
  }

  void _moveToNewProductList() {
    Navigator.pushNamed(context, AppRoutes.productList, arguments: "New");
  }

  void _moveToSpecificCategoryProductList(String category) {
    Navigator.pushNamed(context, AppRoutes.productList, arguments: category);
  }

  void _moveToSpecificProduct(String id) {
    Navigator.pushNamed(context, AppRoutes.productDetails, arguments: id);
  }

  void _moveToProfileScreen() {
    Navigator.pushNamed(context, AppRoutes.profile);
  }
}
