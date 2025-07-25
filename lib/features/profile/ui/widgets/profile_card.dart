import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.name, required this.email});
  final String name;
  final String email;
  @override
  Widget build(BuildContext context) {
    final textStyle = context.textStyle;
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: colors.primaryWeak,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(AssetPaths.shoe),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: textStyle.base.copyWith(
                    color: colors.heading,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  email,
                  style: textStyle.base.copyWith(color: colors.bodyText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
