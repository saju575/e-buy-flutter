import 'package:flutter/material.dart';

extension TextStylesExtension on BuildContext {
  TextStyle get xs => Theme.of(this).textTheme.displaySmall!;
  TextStyle get sm => Theme.of(this).textTheme.labelMedium!;
  TextStyle get base => Theme.of(this).textTheme.bodySmall!;
  TextStyle get lg => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get xl => Theme.of(this).textTheme.titleSmall!;
  TextStyle get x2l => Theme.of(this).textTheme.titleMedium!;
  TextStyle get x3l => Theme.of(this).textTheme.titleLarge!;
}
