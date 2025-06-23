import 'package:e_buy/features/auth/ui/screens/login_screen.dart';
import 'package:e_buy/features/auth/ui/screens/otp_verify_screen.dart';
import 'package:e_buy/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_buy/features/auth/ui/screens/splash_screen.dart';
import 'package:e_buy/features/product/ui/screens/product_details_screen.dart';
import 'package:e_buy/features/product/ui/screens/product_list_screen.dart';
import 'package:e_buy/features/profile/ui/screens/profile_screen.dart';
import 'package:e_buy/features/reviews/ui/screens/create_review_screen.dart';
import 'package:e_buy/features/reviews/ui/screens/reviews_screen.dart';
import 'package:e_buy/features/settings/ui/screens/theme_change_screen.dart';
import 'package:e_buy/features/shared/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = SplashScreen.name;
  static const String login = LoginScreen.name;
  static const String signUp = SignUpScreen.name;
  static const String otpVerify = OtpVerifyScreen.name;
  static const String main = MainBottomNavScreen.name;
  static const String productList = ProductListScreen.name;
  static const String productDetails = ProductDetailsScreen.name;
  static const String reviews = ReviewsScreen.name;
  static const String createReview = CreateReviewScreen.name;
  static const String profile = ProfileScreen.name;
  static const String themeChange = ThemeChangeScreen.name;

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
      case OtpVerifyScreen.name:
        builder = (context) => const OtpVerifyScreen();
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
      case ProductDetailsScreen.name:
        builder = (context) {
          final productId = settings.arguments != null
              ? settings.arguments as String
              : null;
          return ProductDetailsScreen(id: productId);
        };
        break;
      case ReviewsScreen.name:
        builder = (context) {
          final productId = settings.arguments != null
              ? settings.arguments as String
              : null;

          return ReviewsScreen(productId: productId);
        };
        break;
      case CreateReviewScreen.name:
        builder = (context) {
          final productId = settings.arguments != null
              ? settings.arguments as String
              : null;
          return CreateReviewScreen(productId: productId);
        };
        break;
      case ProfileScreen.name:
        builder = (context) => const ProfileScreen();
        break;
      case ThemeChangeScreen.name:
        builder = (context) => const ThemeChangeScreen();
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
