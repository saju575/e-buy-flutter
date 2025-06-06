import 'package:e_buy/app/controllers/app_controller_binder.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EBuy extends StatefulWidget {
  const EBuy({super.key});

  @override
  State<EBuy> createState() => _EBuyState();
}

class _EBuyState extends State<EBuy> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      onGenerateRoute: AppRoutes.routes,
      initialBinding: AppControllerBinder(),
    );
  }
}
