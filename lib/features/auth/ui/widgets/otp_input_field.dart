import 'dart:async';

import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool hasError;
  final StreamController<ErrorAnimationType>? errorController;
  final ValueChanged<String> onChanged;
  final int length;
  const OtpInputField({
    super.key,
    required this.controller,
    this.hasError = false,
    this.errorController,
    this.length = 4,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return PinCodeTextField(
      length: length,
      errorAnimationController: errorController,
      cursorColor: colors.primary,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(4),
        fieldHeight: 40,
        fieldWidth: 40,
        activeFillColor: colors.primaryWeak,
        selectedFillColor: colors.primaryWeak,
        inactiveFillColor: colors.primaryWeak,
        borderWidth: 0,
        activeColor: hasError ? colors.error : Colors.transparent,
        selectedColor: hasError ? colors.error : Colors.transparent,
        inactiveColor: hasError ? colors.error : Colors.transparent,
      ),
      textStyle: textStyle.base.copyWith(
        fontWeight: FontWeight.w600,
        color: colors.heading,
      ),
      animationDuration: const Duration(milliseconds: 200),
      backgroundColor: Colors.transparent,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: controller,
      appContext: context,
      onChanged: onChanged,
    );
  }
}
