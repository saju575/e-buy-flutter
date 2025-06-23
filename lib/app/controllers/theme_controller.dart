import 'package:e_buy/features/settings/data/models/theme_value.dart';
import 'package:e_buy/features/settings/data/theme_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeValue _selectedTheme = themeValueList[1];

  ThemeMode get themeMode => _selectedTheme.value;
  ThemeValue get selectedTheme => _selectedTheme;
  set selectedTheme(ThemeValue theme) {
    _selectedTheme = theme;
    update();
  }
}
