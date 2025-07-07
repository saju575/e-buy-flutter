import 'dart:async';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/auth/domain/models/register_otp_request_model.dart';
import 'package:e_buy/features/auth/domain/models/register_otp_resend_request_model.dart';
import 'package:e_buy/features/auth/ui/controllers/register_otp_verify_controller.dart';
import 'package:e_buy/features/auth/ui/controllers/register_resend_otp_controller.dart';
import 'package:e_buy/features/auth/ui/widgets/auth_header.dart';
import 'package:e_buy/features/auth/ui/widgets/otp_input_field.dart';
import 'package:e_buy/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String email;

  const OtpVerifyScreen({super.key, required this.email});

  static const String name = "otp-verify-screen";
  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  final TextEditingController _pinCodeTEController = TextEditingController();

  final StreamController<ErrorAnimationType> _errorController =
      StreamController<ErrorAnimationType>();

  final ValueNotifier<bool> _hasError = ValueNotifier<bool>(false);

  final RegisterOtpVerifyController _registerOtpVerifyController =
      Get.find<RegisterOtpVerifyController>();
  final RegisterResendOtpController _registerResendOtpController =
      Get.find<RegisterResendOtpController>();

  @override
  void dispose() {
    // _pinCodeTEController.dispose();
    _errorController.close();
    _hasError.dispose();
    // _registerOtpVerifyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    final screenWidth = MediaQuery.of(context).size.width;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: colors.body,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                    onPressed: _onTapNextButton,
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
                      text: "An OTP is sent to ",
                      style: textStyle.base.copyWith(color: colors.bodyText),
                      children: [
                        TextSpan(
                          text: widget.email,
                          style: textStyle.base.copyWith(color: colors.primary),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 11),
                  GestureDetector(
                    onTap: _resendOTP,
                    child: Text(
                      "Resend Code",
                      style: textStyle.base.copyWith(color: colors.primary),
                    ),
                  ),
                ],
              ),
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

  Future<void> _onTapNextButton() async {
    if (_pinCodeTEController.text.length != 4) {
      _triggerError();
    } else {
      RegisterOtpRequestModel registerOtpRequestModel = RegisterOtpRequestModel(
        email: widget.email,
        otp: _pinCodeTEController.text,
      );
      final response = await _onVerifyOTP(
        _registerOtpVerifyController,
        registerOtpRequestModel,
      );
      if (!mounted) return;
      response
          ? Navigator.popUntil(
              context,
              (route) => route.settings.name == AppRoutes.login,
            )
          : ToastUtil.show(
              message:
                  _registerOtpVerifyController.errorMessage ??
                  "OTP verification went wrong",
              context: context,
            );
    }
  }

  Future<bool> _onVerifyOTP(
    RegisterOtpVerifyController registerOtpVerifyController,
    RegisterOtpRequestModel registerOtpRequestModel,
  ) async {
    final isSuccess = await registerOtpVerifyController.verifyRegisterOTP(
      registerOtpRequestModel,
    );
    return isSuccess;
  }

  void _resendOTP() {
    _registerResendOtpController.resendRegisterOTP(
      RegisterOtpResendRequestModel(email: widget.email),
    );
  }
}
