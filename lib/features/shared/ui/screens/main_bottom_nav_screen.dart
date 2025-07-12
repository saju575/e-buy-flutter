import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/cart/ui/screens/cart_screen.dart';
import 'package:e_buy/features/home/ui/controllers/home_controller.dart';
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
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];
  final HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    _homeController.fetchAllData();
  }

  @override
  Widget build(BuildContext buildContext) {
    final colors = buildContext.colors;

    return Scaffold(
      body: GetBuilder<MainBottomNavController>(
        builder: (controller) => _screens[controller.currentIndex],
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavController>(
        builder: (navController) {
          // print("navController.currentIndex ${navController.currentIndex}");
          // return NavigationBar(
          //   selectedIndex: navController.currentIndex,
          //   onDestinationSelected: navController.changeBottomNavIndex,

          //   backgroundColor: colors.primaryWeak,
          //   indicatorColor: colors.primary.withOpacity(0.7),
          //   labelTextStyle: WidgetStateTextStyle.resolveWith(
          //     (states) => textStyle.sm.copyWith(color: colors.bodyText),
          //   ),
          //   destinations: [
          //     NavigationDestination(
          //       icon: AppIcon(iconName: AppIcons.home, size: 22),
          //       label: "Home",
          //     ),
          //     NavigationDestination(
          //       icon: AppIcon(iconName: AppIcons.category, size: 22),
          //       label: "Categories",
          //     ),
          //     NavigationDestination(
          //       icon: AppIcon(iconName: AppIcons.cart, size: 22),
          //       label: "Cart",
          //     ),
          //     NavigationDestination(
          //       icon: AppIcon(iconName: AppIcons.gift, size: 22),
          //       label: "Wish",
          //     ),
          //   ],
          // );

          return BottomNavigationBar(
            currentIndex: navController.currentIndex,
            onTap: navController.changeBottomNavIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: colors.primary,
            unselectedItemColor: colors.heading,
            backgroundColor: colors.primaryWeak,
            iconSize: 22,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedLabelStyle: const TextStyle(height: 1.5),
            unselectedLabelStyle: const TextStyle(height: 1.5),
            elevation: 0,
            items: _buildNavigationItems(navController, colors),
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationItems(
    MainBottomNavController controller,
    AppColors colors,
  ) {
    final navItems = [
      (icon: AppIcons.home, label: 'Home'),
      (icon: AppIcons.category, label: 'Categories'),
      (icon: AppIcons.cart, label: 'Cart'),
      (icon: AppIcons.gift, label: 'Wishlist'),
    ];

    return navItems.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      return BottomNavigationBarItem(
        icon: AppIcon(
          iconName: item.icon,
          size: 22,
          color: controller.currentIndex == index
              ? colors.primary
              : colors.bodyText,
        ),
        label: item.label,
      );
    }).toList();
  }
}


// return GetBuilder<MainBottomNavController>(
//       builder: (navController) {