import 'package:e_buy/features/settings/domain/models/theme_value.dart';
import 'package:flutter/material.dart';

class ThemeValueDto {
  final String title;
  final ThemeMode value;
  ThemeValueDto({required this.title, required this.value});

  factory ThemeValueDto.fromJson(Map<String, dynamic> json) {
    late ThemeMode themeMode;
    switch (json['title']) {
      case "Light":
        themeMode = ThemeMode.light;
        break;
      case "Dark":
        themeMode = ThemeMode.dark;
        break;
      case "System":
        themeMode = ThemeMode.system;
        break;
      default:
        themeMode = ThemeMode.system;
        break;
    }

    return ThemeValueDto(title: json['title'], value: themeMode);
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'value': value.toString().split('.').last};
  }

  ThemeValueDto copyWith({String? title, ThemeMode? value}) {
    return ThemeValueDto(
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }

  ThemeValue toDomain() => ThemeValue(title: title, value: value);
}
