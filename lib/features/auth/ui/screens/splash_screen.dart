import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/circular_progress.dart';
import 'package:e_buy/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToHomeScreen();
  }

  Future _moveToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.login,
      ); // This need to home screen
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(),
              const AppLogo(),
              const Spacer(),
              const CircularProgress(),
              const SizedBox(height: 20),
              Text(
                'Version 1.0.0',
                style: context.lg.copyWith(color: colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
