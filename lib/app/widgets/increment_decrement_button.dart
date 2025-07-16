import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/widgets.dart';

class IncrementDecrementButton extends StatefulWidget {
  const IncrementDecrementButton({
    super.key,
    required this.value,
    required this.onChange,
  });
  final int value;
  final void Function(int value) onChange;
  @override
  State<IncrementDecrementButton> createState() =>
      _IncrementDecrementButtonState();
}

class _IncrementDecrementButtonState extends State<IncrementDecrementButton> {
  int value = 1;
  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  void didUpdateWidget(covariant IncrementDecrementButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      setState(() {
        value = widget.value;
      });
    }
  }

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

  void onTapIncrement() {
    setState(() {
      value++;
      widget.onChange(value);
    });
  }

  void onTapDecrement() {
    setState(() {
      value--;
      widget.onChange(value);
    });
  }
}
