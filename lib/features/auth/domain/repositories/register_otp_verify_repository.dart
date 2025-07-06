import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/auth/domain/models/register_otp_request_model.dart';
import 'package:e_buy/features/auth/domain/models/register_otp_resend_request_model.dart';

abstract class RegisterOtpVerifyRepository {
  Future<Either<Failure, bool>> verifyOtp(
    RegisterOtpRequestModel registerOtpRequestModel,
  );

  Future<Either<Failure, bool>> resendOtp(
    RegisterOtpResendRequestModel registerOtpResendRequestModel,
  );
}
