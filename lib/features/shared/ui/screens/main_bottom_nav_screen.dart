import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/home/ui/screens/home_screen.dart';
import 'package:e_buy/features/product/ui/screens/categories_screen.dart';
import 'package:e_buy/features/shared/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_buy/features/wish_list/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});
  static const name = "/main_bottom_nav_screen";
  @override
  State<StatefulWidget> createState() => MainBottomNavScreenState();
}

class MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    CategoriesScreen(),
    HomeScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext buildContext) {
    final colors = buildContext.colors;
    final textStyle = buildContext.textStyle;
    return GetBuilder<MainBottomNavController>(
      builder: (navController) {
        return Scaffold(
          body: _screens[navController.currentIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: navController.currentIndex,
            onDestinationSelected: navController.changeBottomNavIndex,
            backgroundColor: colors.primaryWeak,
            indicatorColor: colors.primary.withOpacity(0.7),
            labelTextStyle: WidgetStateTextStyle.resolveWith(
              (states) => textStyle.sm.copyWith(color: colors.bodyText),
            ),
            destinations: [
              NavigationDestination(
                icon: AppIcon(iconName: AppIcons.home, size: 22),
                label: "Home",
              ),
              NavigationDestination(
                icon: AppIcon(iconName: AppIcons.category, size: 22),
                label: "Categories",
              ),
              NavigationDestination(
                icon: AppIcon(iconName: AppIcons.cart, size: 22),
                label: "Cart",
              ),
              NavigationDestination(
                icon: AppIcon(iconName: AppIcons.gift, size: 22),
                label: "Wish",
              ),
            ],
          ),
        );
      },
    );
  }
}
