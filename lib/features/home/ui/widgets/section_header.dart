import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            maxLines: 1,
            style: textStyle.xl.copyWith(
              color: colors.heading,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              "See All",
              maxLines: 1,
              style: textStyle.base.copyWith(color: colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
