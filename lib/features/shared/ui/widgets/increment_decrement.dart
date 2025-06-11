import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class IncrementDecrement extends StatelessWidget {
  const IncrementDecrement({
    super.key,
    required this.value,
    required this.onTapDecrement,
    required this.onTapIncrement,
  });
  final int value;
  final VoidCallback onTapDecrement;
  final VoidCallback onTapIncrement;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: value > 1 ? onTapDecrement : null,
          child: _renderIncrementOrDecrementButton(
            colors: colors,
            textStyle: textStyle,
            isIncrement: false,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          value.toString(),
          style: textStyle.base.copyWith(
            color: colors.bodyText,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: onTapIncrement,
          child: _renderIncrementOrDecrementButton(
            colors: colors,
            textStyle: textStyle,
          ),
        ),
      ],
    );
  }

  Widget _renderIncrementOrDecrementButton({
    bool isIncrement = true,
    required AppColors colors,
    required TextStyleTokens textStyle,
  }) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: isIncrement
            ? colors.primary
            : value <= 1
            ? colors.primary.withOpacity(0.5)
            : colors.primary,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Center(
        child: Text(
          isIncrement ? "+" : "-",
          style: textStyle.sm.copyWith(
            color: colors.headingSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
