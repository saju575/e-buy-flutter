import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/widgets/circular_progress.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.title,
    this.onTap,
    this.loading = false,
    this.child,
    this.loaderColor,
    this.loaderSize,
  });
  final String? title;
  final VoidCallback? onTap;
  final bool loading;
  final Widget? child;
  final Color? loaderColor;
  final double? loaderSize;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return ElevatedButton(
      onPressed: loading ? null : onTap,
      child: loading
          ? CircularProgress(
              color: loaderColor ?? colors.primary,
              size: loaderSize ?? 14,
            )
          : child ??
                Text(
                  title ?? "",
                  style: textStyle.base.copyWith(
                    color: colors.headingSecondary,
                  ),
                ),
    );
  }
}
