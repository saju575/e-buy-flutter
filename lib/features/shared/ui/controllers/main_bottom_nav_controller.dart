import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/core/services/navigation/navigation_service.dart';
import 'package:e_buy/features/auth/ui/controllers/auth_controller.dart';
import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  final AuthController _authController;

  MainBottomNavController({required AuthController authController})
    : _authController = authController;

  int _currentIndex = 0;
  final List<int> _privateTabIndex = [2, 3];

  int get currentIndex => _currentIndex;

  void _changeIndex(int index) {
    if (index == _currentIndex) {
      return;
    }
    _currentIndex = index;
    update();
  }

  void changeBottomNavIndex(int index) async {
    final isLoggedIn = _authController.isLoggedIn;
    if (_privateTabIndex.contains(index) && !isLoggedIn) {
      final isSuccess = await NavigationService.pushNamed(
        AppRoutes.login,
        arguments: {"goBack": true},
      );

      if (isSuccess == true) {
        _changeIndex(index);
      }
      return;
    }

    _changeIndex(index);
  }

  void backToHome() {
    _changeIndex(0);
  }

  void moveToCategory() {
    _changeIndex(1);
  }

  void moveToCart() {
    _changeIndex(2);
  }

  void moveToWishlist() {
    _changeIndex(3);
  }
}

// import 'package:get/get.dart';

// class MainBottomNavController extends GetxController {
//   // Use RxInt for reactive state management with GetX
//   final RxInt _currentIndex = 0.obs;

//   int get currentIndex => _currentIndex.value;

//   void _changeIndex(int index) {
//     if (index == _currentIndex.value) return;
//     _currentIndex.value = index;
//   }

//   void changeBottomNavIndex(int index) => _changeIndex(index);
//   void backToHome() => _changeIndex(0);
//   void moveToCategory() => _changeIndex(1);
//   void moveToCart() => _changeIndex(2);
//   void moveToWishlist() => _changeIndex(3);
// }
