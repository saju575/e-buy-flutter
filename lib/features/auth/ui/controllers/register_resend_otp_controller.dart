import 'dart:async';

import 'package:e_buy/features/auth/domain/models/register_otp_resend_request_model.dart';
import 'package:e_buy/features/auth/domain/use_case/register_resend_otp_use_case.dart';
import 'package:get/get.dart';

class RegisterResendOtpController extends GetxController {
  final RegisterResendOtpUseCase _registerResendOtpUseCase;

  RegisterResendOtpController({
    required RegisterResendOtpUseCase registerOtpVerifyUseCase,
  }) : _registerResendOtpUseCase = registerOtpVerifyUseCase;

  bool _loading = false;
  bool _isSuccess = false;
  String? _errorMessage;
  late String _message;

  int _countdown = 60;
  bool _canResend = false;
  Timer? _timer;

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  bool get loading => _loading;
  bool get isSuccess => _isSuccess;
  int get countdown => _countdown;
  bool get canResend => _canResend;
  String? get errorMessage => _errorMessage;

  String get message => _message;

  void startCountdown() {
    _countdown = 60;
    _canResend = false;
    _timer?.cancel();
    update();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        _countdown -= 1;
      } else {
        _canResend = true;
        timer.cancel();
      }
      update();
    });
    update();
  }

  Future<void> resendRegisterOTP(
    RegisterOtpResendRequestModel registerOtpResendRequestModel,
  ) async {
    if (!_canResend) return;
    _isSuccess = false;
    _loading = true;
    update();
    final response = await _registerResendOtpUseCase.execute(
      registerOtpResendRequestModel,
    );
    response.fold(
      (leftValue) {
        _errorMessage = leftValue.message;
        _isSuccess = false;
      },
      (rightValue) {
        _message = 'New OTP has been sent to your email address.';
        _isSuccess = true;
        // startCountdown();
      },
    );
    _loading = false;
    update();
  }
}
