import 'package:e_buy/app/colors/app_color.dart';
import 'package:e_buy/app/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get light => _base(LightColors());
  ThemeData get dark => _base(DarkColors());

  ThemeData _base(AppColor color) {
    return ThemeData(extensions: [color]);
  }
}
