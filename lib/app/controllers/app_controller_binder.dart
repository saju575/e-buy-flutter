import 'package:e_buy/features/shared/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class AppControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
  }
}
