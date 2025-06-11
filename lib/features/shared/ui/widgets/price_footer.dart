import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class PriceFooter extends StatelessWidget {
  const PriceFooter({
    super.key,
    required this.price,
    this.onTapButton,
    required this.buttonText,
    required this.title,
  });

  final double price;
  final VoidCallback? onTapButton;
  final String buttonText;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: colors.primaryWeak,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: textStyle.base.copyWith(color: colors.bodyText),
              ),
              Text(
                "Rs $price",
                style: textStyle.lg.copyWith(color: colors.primary),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 118,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(colors.primary),
              ),
              onPressed: onTapButton,
              child: Text(
                buttonText,
                style: textStyle.sm.copyWith(color: colors.headingSecondary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
