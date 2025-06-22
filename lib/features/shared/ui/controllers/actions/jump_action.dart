import 'package:e_buy/features/shared/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

void moveToHomeScreen() {
  Get.find<MainBottomNavController>().backToHome();
}

void moveToCartScreen() {
  Get.find<MainBottomNavController>().moveToCart();
}

void moveToCategoryScreen() {
  Get.find<MainBottomNavController>().moveToCategory();
}

void moveToWishlistScreen() {
  Get.find<MainBottomNavController>().moveToWishlist();
}

void moveToProfileScreen() {
  Get.find<MainBottomNavController>().moveToProfile();
}
