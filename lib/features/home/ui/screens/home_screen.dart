import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/home/ui/widgets/app_bar_icon.dart';
import 'package:e_buy/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:e_buy/features/home/ui/widgets/product_search_bar.dart';
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
    // final colors = context.colors;
    // final textStyle = context.textStyle;
    return Scaffold(
      appBar: _renderAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProductSearchBar(),
              SizedBox(height: 12),

              HomeCarouselSlider(),
              SizedBox(height: 12),
              _renderHeader(
                context: context,
                title: "Categories",
                onTap: () {},
              ),
              SizedBox(height: 12),
              _renderCategories(),
              SizedBox(height: 12),
              _renderHeader(context: context, title: "Popular", onTap: () {}),
              SizedBox(height: 12),
              _renderPopularItems(),
              SizedBox(height: 12),
              _renderHeader(context: context, title: "Special", onTap: () {}),
              SizedBox(height: 12),
              _renderSpecialItems(),
              SizedBox(height: 12),
              _renderHeader(context: context, title: "New", onTap: () {}),
              SizedBox(height: 12),
              _renderNewItems(),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _renderAppBar() {
    return AppBar(
      title: AppIcon(iconName: AssetPaths.appLogoSvg, size: 28),
      actions: [
        AppBarIcon(iconName: AppIcons.bell, onTap: () {}),
        AppBarIcon(iconName: AppIcons.user, onTap: () {}),
      ],
    );
  }

  Widget _renderHeader({
    required BuildContext context,
    required String title,
    required VoidCallback onTap,
  }) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Row(
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
          onTap: () {},
          child: Text(
            "See All",
            maxLines: 1,
            style: textStyle.base.copyWith(color: colors.primary),
          ),
        ),
      ],
    );
  }

  Widget _renderCategories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ProductCategory(title: "Food");
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
          return ProductCard(width: 115);
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
          return ProductCard(width: 115);
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
          return ProductCard(width: 115);
        },
      ),
    );
  }
}
