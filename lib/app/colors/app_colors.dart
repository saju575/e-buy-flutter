import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color secondary;
  final Color primaryWeak;
  final Color foreground;
  final Color body;
  final Color grey;
  final Color base;
  final Color bodyText;
  final Color heading;
  final Color headingSecondary;
  final Color border;
  final Color errorBorder;
  final Color successBorder;
  final Color warningBorder;
  final Color error;
  final Color errorBg;
  final Color success;
  final Color successBg;
  final Color warning;
  final Color warningBg;
  final Color blur;
  final Color reelNftCard; // rgba(135,135,135,0.45)
  final Color disable;
  final Color loaderDefault;
  final Color splashLoader;
  final Color switchC;

  const AppColors({
    required this.primary,
    required this.secondary,
    required this.primaryWeak,
    required this.foreground,
    required this.body,
    required this.grey,
    required this.base,
    required this.bodyText,
    required this.heading,
    required this.headingSecondary,
    required this.border,
    required this.errorBorder,
    required this.successBorder,
    required this.warningBorder,
    required this.error,
    required this.errorBg,
    required this.success,
    required this.successBg,
    required this.warning,
    required this.warningBg,
    required this.blur,
    required this.reelNftCard,
    required this.disable,
    required this.loaderDefault,
    required this.splashLoader,
    required this.switchC,
  });

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? primaryWeak,
    Color? foreground,
    Color? body,
    Color? grey,
    Color? base,
    Color? bodyText,
    Color? heading,
    Color? headingSecondary,
    Color? border,
    Color? errorBorder,
    Color? successBorder,
    Color? warningBorder,
    Color? error,
    Color? errorBg,
    Color? success,
    Color? successBg,
    Color? warning,
    Color? warningBg,
    Color? blur,
    Color? reelNftCard,
    Color? disable,
    Color? loaderDefault,
    Color? splashLoader,
    Color? switchC,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      primaryWeak: primaryWeak ?? this.primaryWeak,
      foreground: foreground ?? this.foreground,
      body: body ?? this.body,
      grey: grey ?? this.grey,
      base: base ?? this.base,
      bodyText: bodyText ?? this.bodyText,
      heading: heading ?? this.heading,
      headingSecondary: headingSecondary ?? this.headingSecondary,
      border: border ?? this.border,
      errorBorder: errorBorder ?? this.errorBorder,
      successBorder: successBorder ?? this.successBorder,
      warningBorder: warningBorder ?? this.warningBorder,
      error: error ?? this.error,
      errorBg: errorBg ?? this.errorBg,
      success: success ?? this.success,
      successBg: successBg ?? this.successBg,
      warning: warning ?? this.warning,
      warningBg: warningBg ?? this.warningBg,
      blur: blur ?? this.blur,
      reelNftCard: reelNftCard ?? this.reelNftCard,
      disable: disable ?? this.disable,
      loaderDefault: loaderDefault ?? this.loaderDefault,
      splashLoader: splashLoader ?? this.splashLoader,
      switchC: switchC ?? this.switchC,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      primaryWeak: Color.lerp(primaryWeak, other.primaryWeak, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      body: Color.lerp(body, other.body, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      base: Color.lerp(base, other.base, t)!,
      bodyText: Color.lerp(bodyText, other.bodyText, t)!,
      heading: Color.lerp(heading, other.heading, t)!,
      headingSecondary: Color.lerp(
        headingSecondary,
        other.headingSecondary,
        t,
      )!,
      border: Color.lerp(border, other.border, t)!,
      errorBorder: Color.lerp(errorBorder, other.errorBorder, t)!,
      successBorder: Color.lerp(successBorder, other.successBorder, t)!,
      warningBorder: Color.lerp(warningBorder, other.warningBorder, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorBg: Color.lerp(errorBg, other.errorBg, t)!,
      success: Color.lerp(success, other.success, t)!,
      successBg: Color.lerp(successBg, other.successBg, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningBg: Color.lerp(warningBg, other.warningBg, t)!,
      blur: Color.lerp(blur, other.blur, t)!,
      reelNftCard: Color.lerp(reelNftCard, other.reelNftCard, t)!,
      disable: Color.lerp(disable, other.disable, t)!,
      loaderDefault: Color.lerp(loaderDefault, other.loaderDefault, t)!,
      splashLoader: Color.lerp(splashLoader, other.splashLoader, t)!,
      switchC: Color.lerp(switchC, other.switchC, t)!,
    );
  }
}
