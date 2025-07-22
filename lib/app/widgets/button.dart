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
    this.width,
    this.color,
  });
  final String? title;
  final VoidCallback? onTap;
  final bool loading;
  final Widget? child;
  final Color? loaderColor;
  final double? loaderSize;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromWidth(width ?? double.maxFinite),
        backgroundColor: color ?? colors.primary,
      ),
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
