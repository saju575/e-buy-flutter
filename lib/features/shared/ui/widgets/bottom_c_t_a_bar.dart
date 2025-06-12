import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:flutter/material.dart';

class BottomCTABar extends StatelessWidget {
  const BottomCTABar({
    super.key,
    required this.titlePreview,
    required this.actionPreview,
  });

  final Widget titlePreview;
  final Widget actionPreview;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

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
        children: [titlePreview, Spacer(), actionPreview],
      ),
    );
  }
}
