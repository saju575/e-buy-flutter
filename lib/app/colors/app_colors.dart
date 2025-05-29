import 'package:e_buy/app/colors/app_color.dart';
import 'package:e_buy/app/colors/app_palette.dart';

class LightColors extends AppColor {
  LightColors()
    : super(
        primary: AppPalette.primary[500]!,
        secondary: AppPalette.secondary[500]!,
        primaryWeak: AppPalette.primary[50]!,
        foregroundColor: AppPalette.primary[50]!,
        bodyColor: AppPalette.secondary[50]!,
        grayColor: AppPalette.gray[200]!,
        baseColor: AppPalette.white,
        bodyTextColor: AppPalette.gray[500]!,
        headingColor: AppPalette.gray[900]!,
        headingColorSecondary: AppPalette.white,
        borderColor: AppPalette.primary[50]!,
        errorBorderColor: AppPalette.danger[300]!,
        successBorderColor: AppPalette.success[200]!,
        warningBorderColor: AppPalette.warning[200]!,
        errorColor: AppPalette.red[500]!,
        errorBgColor: AppPalette.red[50]!,
        successColor: AppPalette.success[500]!,
        successBgColor: AppPalette.success[50]!,
        warningColor: AppPalette.warning[400]!,
        warningBgColor: AppPalette.warning[100]!,
        blurColor: AppPalette.blurColor,
        reelNftCard: AppPalette.reelNftCard,
        disableColor: AppPalette.disabledColor,
        loaderDefault: AppPalette.gray[800]!,
        splashLoader: AppPalette.primary[500]!,
        switchColor: AppPalette.gray[400]!,
      );
}

class DarkColors extends AppColor {
  DarkColors()
    : super(
        primary: AppPalette.primary[500]!,
        secondary: AppPalette.secondary[500]!,
        primaryWeak: AppPalette.primary[950]!,
        foregroundColor: AppPalette.purple[950]!,
        bodyColor: AppPalette.gray[950]!,
        grayColor: AppPalette.gray[200]!,
        baseColor: AppPalette.primary[950]!,
        bodyTextColor: AppPalette.gray[50]!,
        headingColor: AppPalette.white,
        headingColorSecondary: AppPalette.white,
        borderColor: AppPalette.gray[800]!,
        errorBorderColor: AppPalette.red[900]!,
        successBorderColor: AppPalette.success[900]!,
        warningBorderColor: AppPalette.brown[500]!,
        errorColor: AppPalette.red[600]!,
        errorBgColor: AppPalette.danger[950]!,
        successColor: AppPalette.success[500]!,
        successBgColor: AppPalette.primary[900]!,
        warningColor: AppPalette.warning[400]!,
        warningBgColor: AppPalette.secondary[950]!,
        blurColor: AppPalette.blurColor,
        reelNftCard: AppPalette.reelNftCard,
        disableColor: AppPalette.disabledColor,
        loaderDefault: AppPalette.white,
        splashLoader: AppPalette.white,
        switchColor: AppPalette.white,
      );
}
