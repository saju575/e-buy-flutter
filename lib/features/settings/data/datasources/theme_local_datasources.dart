import 'dart:convert';
import 'package:e_buy/core/services/local_storage/shared_pref_service.dart';
import 'package:e_buy/features/settings/data/models/theme_value_dto.dart';
import 'package:flutter/material.dart';

class ThemeLocalDatasources {
  final String _themeKey = "themeKey";
  final List<ThemeValueDto> _themeValueList = [
    ThemeValueDto(title: "Light", value: ThemeMode.light),
    ThemeValueDto(title: "Dark", value: ThemeMode.dark),
    ThemeValueDto(title: "System", value: ThemeMode.system),
  ];

  final SharedPrefService _sharedPreferService;
  ThemeLocalDatasources({required SharedPrefService sharedPreferService})
    : _sharedPreferService = sharedPreferService;

  ThemeValueDto getThemeFromLocalStorage() {
    final themeJsonString = _sharedPreferService.getString(_themeKey);

    if (themeJsonString != null) {
      return ThemeValueDto.fromJson(json.decode(themeJsonString));
    } else {
      return _themeValueList.last;
    }
  }

  Future<void> saveThemeToLocalStorage(ThemeValueDto theme) async {
    await _sharedPreferService.setString(
      _themeKey,
      json.encode(theme.toJson()),
    );
  }

  List<ThemeValueDto> get getThemeList => _themeValueList;
}
