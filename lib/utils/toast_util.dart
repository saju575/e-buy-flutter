import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtil {
  static void show({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Toast length = Toast.LENGTH_SHORT,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    double fontSize = 16.0,
    BuildContext? context, // Needed for SnackBar fallback
  }) {
    if (kIsWeb ||
        (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
      // Use SnackBar for Web/Desktop
      if (context != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Center(
              child: Text(
                message,
                style: TextStyle(color: textColor, fontSize: fontSize),
              ),
            ),
            backgroundColor: backgroundColor,
            duration: length == Toast.LENGTH_SHORT
                ? Duration(seconds: 2)
                : Duration(seconds: 4),
          ),
        );
      }
    } else {
      // Use FlutterToast for Mobile
      Fluttertoast.showToast(
        msg: message,
        toastLength: length,
        gravity: gravity,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize,
      );
    }
  }
}
