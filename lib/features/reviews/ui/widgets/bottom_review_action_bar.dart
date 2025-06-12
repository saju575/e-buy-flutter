import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class BottomReviewActionBar extends StatelessWidget {
  const BottomReviewActionBar({
    super.key,
    this.onTapButton,
    this.totalReviews = 0,
  });

  final VoidCallback? onTapButton;
  final int totalReviews;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return BottomCTABar(
      titlePreview: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Reviews ($totalReviews)",
            style: textStyle.base.copyWith(color: colors.bodyText),
          ),
        ],
      ),
      actionPreview: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: colors.primary,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: AppIcon(icon: Icons.add, color: colors.headingSecondary),
          onPressed: onTapButton,
        ),
      ),
    );
  }
}
