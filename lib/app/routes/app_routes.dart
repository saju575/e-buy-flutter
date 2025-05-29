import 'package:e_buy/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screen;
    if (settings.name == SplashScreen.name) {
      screen = SplashScreen();
    }
    return MaterialPageRoute(builder: (context) => screen);
  }
}
