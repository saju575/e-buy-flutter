import 'package:e_buy/app/app.dart';
import 'package:e_buy/app/controllers/app_controller_binder.dart';
import 'package:e_buy/core/services/local_storage/shared_pref_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  AppControllerBinder().dependencies();
  runApp(const EBuy());
}
