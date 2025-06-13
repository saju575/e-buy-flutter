import 'dart:async';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/features/auth/ui/widgets/auth_header.dart';
import 'package:e_buy/features/auth/ui/widgets/otp_input_field.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key});
  static const String name = "otp-verify-screen";
  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final TextEditingController _pinCodeTEController = TextEditingController();

  final StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();

  final ValueNotifier<bool> _hasError = ValueNotifier<bool>(false);

  @override
  void dispose() {
    // _pinCodeTEController.dispose();
    _errorController.close();
    _hasError.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 80, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AuthHeader(
                  title: "Enter OTP Code",
                  subtitle: "A 4 digit code has been sent",
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: screenWidth * 0.6,
                  child: ValueListenableBuilder<bool>(
                    valueListenable: _hasError,
                    builder: (context, notifierValue, child) {
                      return OtpInputField(
                        controller: _pinCodeTEController,
                        errorController: _errorController,
                        hasError: notifierValue,
                        onChanged: (value) {
                          if (notifierValue) {
                            _hasError.value = false;
                          }
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _onTapSubmit,
                  child: Text(
                    "Next",
                    style: textStyle.base.copyWith(
                      color: colors.headingSecondary,
                    ),
                  ),
                ),
                const SizedBox(height: 37),
                Text.rich(
                  TextSpan(
                    text: "This code will expire in ",
                    style: textStyle.base.copyWith(color: colors.bodyText),
                    children: [
                      TextSpan(
                        text: "30s",
                        style: textStyle.base.copyWith(color: colors.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  "Resend Code",
                  style: textStyle.base.copyWith(color: colors.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _triggerError() {
    _errorController.add(ErrorAnimationType.shake);
    _hasError.value = true;
  }

  void _onTapSubmit() {
    if (_pinCodeTEController.text.length != 4) {
      _triggerError();
    }
  }
}
