import 'package:flutter/material.dart';

extension TextStyleContextExtension on BuildContext {
  TextStyleTokens get textStyle => TextStyleTokens(this);
}

class TextStyleTokens {
  final BuildContext context;
  TextStyleTokens(this.context);

  TextStyle get xs => Theme.of(context).textTheme.displaySmall!;
  TextStyle get sm => Theme.of(context).textTheme.labelMedium!;
  TextStyle get base => Theme.of(context).textTheme.bodySmall!;
  TextStyle get lg => Theme.of(context).textTheme.bodyMedium!;
  TextStyle get xl => Theme.of(context).textTheme.titleSmall!;
  TextStyle get x2l => Theme.of(context).textTheme.titleMedium!;
  TextStyle get x3l => Theme.of(context).textTheme.titleLarge!;
}
