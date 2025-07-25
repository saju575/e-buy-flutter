import 'package:e_buy/app/controllers/app_controller_binder.dart';
import 'package:e_buy/app/controllers/theme_controller.dart';
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
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (context) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(context.themeMode),
          darkTheme: AppTheme.dark(context.themeMode),
          themeMode: context.themeMode,
          onGenerateRoute: AppRoutes.routes,
          initialBinding: AppControllerBinder(),
        );
      },
    );
  }
}
