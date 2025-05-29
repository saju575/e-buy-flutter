import 'package:e_buy/app/colors/app_color.dart';
import 'package:e_buy/app/colors/app_colors.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  AppColor get color => Theme.of(this).extension<AppColor>() ?? LightColors();
}
