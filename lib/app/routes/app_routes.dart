import 'package:e_buy/features/auth/ui/screens/login_screen.dart';
import 'package:e_buy/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_buy/features/auth/ui/screens/splash_screen.dart';
import 'package:e_buy/features/product/ui/screens/product_list_screen.dart';
import 'package:e_buy/features/shared/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = SplashScreen.name;
  static const String login = LoginScreen.name;
  static const String signUp = SignUpScreen.name;
  static const String main = MainBottomNavScreen.name;
  static const String productList = ProductListScreen.name;

  static Route<dynamic> routes(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case SplashScreen.name:
        builder = (context) => const SplashScreen();
        break;
      case LoginScreen.name:
        builder = (context) => const LoginScreen();
        break;
      case SignUpScreen.name:
        builder = (context) => const SignUpScreen();
        break;
      case MainBottomNavScreen.name:
        builder = (context) => const MainBottomNavScreen();
        break;
      case ProductListScreen.name:
        builder = (context) {
          final category = settings.arguments as String;
          return ProductListScreen(category: category);
        };
        break;
      default:
        builder = (context) => const LoginScreen();
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        final fadeTween = Tween<double>(
          begin: 0.5,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeIn));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation.drive(fadeTween),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400), // smoother pace
      settings: settings,
    );
  }
}
