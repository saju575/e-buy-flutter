import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/circular_progress.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class BottomPurchaseBar extends StatelessWidget {
  const BottomPurchaseBar({
    super.key,
    required this.price,
    this.onTapButton,
    required this.buttonText,
    required this.title,
    this.loading = false,
    this.disabled = false,
  });

  final double price;
  final VoidCallback? onTapButton;
  final String buttonText;
  final String title;
  final bool loading;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return BottomCTABar(
      titlePreview: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: textStyle.base.copyWith(color: colors.bodyText)),
          Text(
            "Rs $price",
            style: textStyle.lg.copyWith(color: colors.primary),
          ),
        ],
      ),
      actionPreview: SizedBox(
        width: 118,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              disabled ? colors.reelNftCard : colors.primary,
            ),
          ),
          onPressed: disabled ? null : onTapButton,
          child: loading
              ? CircularProgress(color: colors.bodyText, size: 14)
              : Text(
                  buttonText,
                  style: textStyle.sm.copyWith(color: colors.headingSecondary),
                ),
        ),
      ),
    );
  }
}
