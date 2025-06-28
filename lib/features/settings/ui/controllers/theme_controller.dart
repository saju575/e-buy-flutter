import 'package:e_buy/features/settings/domain/models/theme_value.dart';
import 'package:e_buy/features/settings/domain/use_cases/theme_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final ThemeUseCase _themeUseCase;
  ThemeController({required ThemeUseCase themeUseCase})
    : _themeUseCase = themeUseCase;

  late ThemeValue _selectedTheme = _themeUseCase.getThemeMode;

  ThemeMode get themeMode => _selectedTheme.value;
  ThemeValue get selectedTheme => _selectedTheme;
  List<ThemeValue> get themeList => _themeUseCase.getThemeList;

  Future<void> updateTheme(ThemeValue theme) async {
    _selectedTheme = theme;
    update();
    await _themeUseCase.setThemeMode(theme);
  }
}
