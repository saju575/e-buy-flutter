import 'package:e_buy/app/actions/auth_actions.dart';
import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/app/widgets/global_loading.dart';
import 'package:e_buy/features/home/domain/models/slide_model.dart';
import 'package:e_buy/features/home/ui/controllers/home_controller.dart';
import 'package:e_buy/features/home/ui/controllers/slide_controller.dart';
import 'package:e_buy/features/home/ui/widgets/app_bar_icon.dart';
import 'package:e_buy/features/home/ui/widgets/category_section.dart';
import 'package:e_buy/features/home/ui/widgets/new_products_section.dart';
import 'package:e_buy/features/home/ui/widgets/popular_products_section.dart';
import 'package:e_buy/features/home/ui/widgets/product_search_bar.dart';
import 'package:e_buy/features/home/ui/widgets/slider_card.dart';
import 'package:e_buy/features/home/ui/widgets/special_products_section.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: GetBuilder<HomeController>(
        builder: (homeContext) {
          return GlobalLoading(
            isLoading: homeContext.initialLoading,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ProductSearchBar(),
                  ),
                  const SizedBox(height: 12),
                  _renderSlide(colors),

                  const CategorySection(),
                  SizedBox(height: 12),
                  const PopularProductsSection(),
                  const SizedBox(height: 12),
                  const SpecialProductsSection(),
                  const SizedBox(height: 12),
                  const NewProductsSection(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _renderSlide(AppColors colors) {
    return GetBuilder<SlideController>(
      builder: (slideContext) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppCarouselSlider<SlideModel>(
            indicatorColor: colors.primaryWeak,
            indicatorActiveColor: colors.primary,
            items: slideContext.slides,
            sliderCardBuilder: (width, height, index, item) =>
                SliderCard(width: width, height: height, slide: item),
          ),
        );
      },
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

  void _moveToProfileScreen() {
    if (AuthActions.isLoggedIn) {
      Navigator.pushNamed(context, AppRoutes.profile);
    } else {
      Navigator.pushNamed(
        context,
        AppRoutes.login,
        arguments: AppRoutes.profile,
      );
    }
  }
}
