import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/auth/domain/models/register_otp_resend_request_model.dart';
import 'package:e_buy/features/auth/domain/repositories/register_otp_verify_repository.dart';

class RegisterResendOtpUseCase {
  final RegisterOtpVerifyRepository _registerOtpVerifyRepository;

  RegisterResendOtpUseCase({
    required RegisterOtpVerifyRepository registerOtpVerifyRepository,
  }) : _registerOtpVerifyRepository = registerOtpVerifyRepository;

  Future<Either<Failure, bool>> execute(
    RegisterOtpResendRequestModel registerOtpResendRequestModel,
  ) async {
    return await _registerOtpVerifyRepository.resendOtp(
      registerOtpResendRequestModel,
    );
  }
}
