import 'package:e_buy/features/auth/ui/controllers/auth_controller.dart';
import 'package:e_buy/features/auth/ui/controllers/login_controller.dart';

import 'package:get/get.dart';

class AuthActions {
  static final LoginController _loginController = Get.find<LoginController>();
  static final AuthController _authController = Get.find<AuthController>();

  static bool get isLoggedIn => _authController.isLoggedIn;

  static void logout() => _loginController.logout();
  static String get token => _authController.getToken;
}
