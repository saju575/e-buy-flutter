import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/auth/domain/models/register_otp_request_model.dart';
import 'package:e_buy/features/auth/domain/repositories/register_otp_verify_repository.dart';

class RegisterOtpVerifyUseCase {
  final RegisterOtpVerifyRepository _registerOtpVerifyRepository;

  RegisterOtpVerifyUseCase({
    required RegisterOtpVerifyRepository registerOtpVerifyRepository,
  }) : _registerOtpVerifyRepository = registerOtpVerifyRepository;

  Future<Either<Failure, bool>> execute(
    RegisterOtpRequestModel registerOtpRequestModel,
  ) async {
    return await _registerOtpVerifyRepository.verifyOtp(
      registerOtpRequestModel,
    );
  }
}
