import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/colors/light_dark_colors.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData light(ThemeMode themeMode) =>
      _base(LightColors(), themeMode);
  static ThemeData dark(ThemeMode themeMode) => _base(DarkColors(), themeMode);

  static ThemeData _base(AppColors color, ThemeMode themeMode) {
    return ThemeData(
      dividerColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      extensions: [color],
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: _customTextTheme,
      inputDecorationTheme: _inputDecorationTheme(color),
      elevatedButtonTheme: _elevatedButtonTheme(color),
      scaffoldBackgroundColor: color.body,
      primaryColor: color.primary,
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (context) =>
            AppIcon(icon: Icons.arrow_back, color: color.heading),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: color.body,
        iconTheme: IconThemeData(color: color.bodyText),
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: color.body,
          statusBarIconBrightness: themeMode == ThemeMode.light
              ? Brightness.dark
              : Brightness.light,
        ),
        titleTextStyle: TextStyle(
          color: color.bodyText,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),

        // titleSpacing: 0.0,
        // shape: Border(bottom: BorderSide(width: .5, color: color.border)),
      ),
    );
  }

  static TextTheme get _customTextTheme => TextTheme(
    labelSmall: TextStyle(
      // xs
      fontSize: 8,
      height: 14 / 8,
      fontFamily: 'Inter',
      // fontFamily: 'Poppins',
    ),
    labelMedium: TextStyle(
      // sm
      fontSize: 12,
      height: 18 / 12,
      fontFamily: 'Inter',
      // fontFamily: 'Poppins',
    ),
    bodySmall: TextStyle(
      // base
      fontSize: 14,
      height: 20 / 14,
      fontFamily: 'Inter',
      // fontFamily: 'Poppins',
    ),
    bodyMedium: TextStyle(
      // lg
      fontSize: 16,
      height: 24 / 16,
      fontFamily: 'Inter',
      // fontFamily: 'Poppins',
    ),
    titleSmall: TextStyle(
      // xl
      fontSize: 18,
      height: 26 / 18,
      fontFamily: 'Inter',
      // fontFamily: 'Poppins',
    ),
    titleMedium: TextStyle(
      // 2xl
      fontSize: 20,
      height: 28 / 20,
      fontFamily: 'Inter',
      // fontFamily: 'Poppins',
    ),
    titleLarge: TextStyle(
      // 3xl
      fontSize: 24,
      height: 32 / 24,
      fontFamily: 'Inter',
      // fontFamily: 'Poppins',
    ),
  );

  static InputDecorationTheme _inputDecorationTheme(AppColors color) =>
      InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(6),
        ),
        focusedBorder: _getInputBorder(color.primaryWeak),
        errorBorder: _getInputBorder(color.error),
        fillColor: color.primaryWeak,
        filled: true,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: color.grey,
          fontSize: 14,
        ),
      );

  static ElevatedButtonThemeData _elevatedButtonTheme(AppColors color) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: Size.fromWidth(double.maxFinite),
          backgroundColor: color.primary,
          foregroundColor: color.headingSecondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 12),
          textStyle: TextStyle(
            fontSize: 14,
            letterSpacing: 0.4,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
  static OutlineInputBorder _getInputBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1),
      borderRadius: BorderRadius.circular(6),
    );
  }
}
