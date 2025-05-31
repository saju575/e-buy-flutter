import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/colors/light_dark_colors.dart';
import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ?? LightColors();
}
