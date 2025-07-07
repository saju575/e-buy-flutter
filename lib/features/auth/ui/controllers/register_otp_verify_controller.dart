import 'package:e_buy/features/auth/domain/models/register_otp_request_model.dart';
import 'package:e_buy/features/auth/domain/use_case/register_otp_verify_use_case.dart';

import 'package:get/get.dart';

class RegisterOtpVerifyController extends GetxController {
  final RegisterOtpVerifyUseCase _registerOtpVerifyUseCase;

  RegisterOtpVerifyController({
    required RegisterOtpVerifyUseCase registerOtpVerifyUseCase,
  }) : _registerOtpVerifyUseCase = registerOtpVerifyUseCase;

  bool _loading = false;

  String? _errorMessage;
  late String _message;

  bool get loading => _loading;

  String? get errorMessage => _errorMessage;

  String get message => _message;

  Future<bool> verifyRegisterOTP(
    RegisterOtpRequestModel registerOtpRequestModel,
  ) async {
    bool isSuccess = false;
    _loading = true;
    update();
    final response = await _registerOtpVerifyUseCase.execute(
      registerOtpRequestModel,
    );
    response.fold(
      (leftValue) {
        _errorMessage = leftValue.message;
        isSuccess = false;
      },
      (rightValue) {
        _message = 'An OTP has been sent to your email address.';
        isSuccess = true;
      },
    );
    _loading = false;
    update();
    return isSuccess;
  }
}
