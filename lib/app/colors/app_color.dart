import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  final Color primary;
  final Color secondary;
  final Color primaryWeak;
  final Color foregroundColor;
  final Color bodyColor;
  final Color grayColor;
  final Color baseColor;
  final Color bodyTextColor;
  final Color headingColor;
  final Color headingColorSecondary;
  final Color borderColor;
  final Color errorBorderColor;
  final Color successBorderColor;
  final Color warningBorderColor;
  final Color errorColor;
  final Color errorBgColor;
  final Color successColor;
  final Color successBgColor;
  final Color warningColor;
  final Color warningBgColor;
  final Color blurColor;
  final Color reelNftCard; // rgba(135,135,135,0.45)
  final Color disableColor;
  final Color loaderDefault;
  final Color splashLoader;
  final Color switchColor;

  const AppColor({
    required this.primary,
    required this.secondary,
    required this.primaryWeak,
    required this.foregroundColor,
    required this.bodyColor,
    required this.grayColor,
    required this.baseColor,
    required this.bodyTextColor,
    required this.headingColor,
    required this.headingColorSecondary,
    required this.borderColor,
    required this.errorBorderColor,
    required this.successBorderColor,
    required this.warningBorderColor,
    required this.errorColor,
    required this.errorBgColor,
    required this.successColor,
    required this.successBgColor,
    required this.warningColor,
    required this.warningBgColor,
    required this.blurColor,
    required this.reelNftCard,
    required this.disableColor,
    required this.loaderDefault,
    required this.splashLoader,
    required this.switchColor,
  });
  @override
  ThemeExtension<AppColor> copyWith() => this;

  @override
  ThemeExtension<AppColor> lerp(
    covariant ThemeExtension<AppColor>? other,
    double t,
  ) => this;
}
