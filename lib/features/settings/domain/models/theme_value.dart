import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeValue extends Equatable {
  final String title;
  final ThemeMode value;
  const ThemeValue({required this.title, required this.value});

  @override
  List<Object?> get props => [title, value];
}
