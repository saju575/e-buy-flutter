import 'package:get/get.dart';

class MainBottomNavController extends GetxController {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void _changeIndex(int index) {
    if (index == _currentIndex) return;
    _currentIndex = index;
    update();
  }

  void changeBottomNavIndex(int index) {
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

  //   void moveToProfile() {
  //     _changeIndex(4);
  //   }
}
