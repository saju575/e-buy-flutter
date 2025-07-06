import 'package:e_buy/features/auth/domain/models/register_otp_resend_request_model.dart';
import 'package:e_buy/features/auth/domain/use_case/register_resend_otp_use_case.dart';
import 'package:get/get.dart';

class RegisterResendOtpController extends GetxController {
  final RegisterResendOtpUseCase _registerResendOtpUseCase;

  RegisterResendOtpController({
    required RegisterResendOtpUseCase registerOtpVerifyUseCase,
  }) : _registerResendOtpUseCase = registerOtpVerifyUseCase;

  bool _loading = false;

  String? _errorMessage;
  late String _message;

  bool get loading => _loading;

  String? get errorMessage => _errorMessage;

  String get message => _message;

  Future<bool> resendRegisterOTP(
    RegisterOtpResendRequestModel registerOtpResendRequestModel,
  ) async {
    bool isSuccess = false;
    _loading = true;
    update();
    final response = await _registerResendOtpUseCase.execute(
      registerOtpResendRequestModel,
    );
    response.fold(
      (leftValue) {
        _errorMessage = leftValue.message;
        isSuccess = false;
      },
      (rightValue) {
        _message = 'New OTP has been sent to your email address.';
        isSuccess = true;
      },
    );
    _loading = false;
    update();
    return isSuccess;
  }
}
