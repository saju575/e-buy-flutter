import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class InputTitle extends StatelessWidget {
  const InputTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      title,
      style: context.base.copyWith(
        color: colors.heading,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
