import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class EBuy extends StatefulWidget {
  const EBuy({super.key});

  @override
  State<EBuy> createState() => _EBuyState();
}

class _EBuyState extends State<EBuy> {
  @override
  Widget build(BuildContext context) {
    final AppTheme theme = AppTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.light,
      darkTheme: theme.dark,
      onGenerateRoute: AppRoutes.routes,
    );
  }
}
