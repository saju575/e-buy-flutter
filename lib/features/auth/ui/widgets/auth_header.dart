import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppLogo(),
          const SizedBox(height: 28),
          Text(
            title,
            style: textStyle.lg.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.heading,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: textStyle.base.copyWith(color: colors.bodyText),
          ),
        ],
      ),
    );
  }
}
