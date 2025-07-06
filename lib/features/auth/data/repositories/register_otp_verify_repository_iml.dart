import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/auth/data/data_source/register_otp_verify_data_source.dart';
import 'package:e_buy/features/auth/data/models/register_otp_request_dto.dart';
import 'package:e_buy/features/auth/data/models/register_otp_resend_request_dto.dart';
import 'package:e_buy/features/auth/domain/models/register_otp_request_model.dart';
import 'package:e_buy/features/auth/domain/models/register_otp_resend_request_model.dart';
import 'package:e_buy/features/auth/domain/repositories/register_otp_verify_repository.dart';

class RegisterOtpVerifyRepositoryIml implements RegisterOtpVerifyRepository {
  final RegisterOtpVerifyDataSource _registerOtpVerifyDataSource;

  RegisterOtpVerifyRepositoryIml({
    required RegisterOtpVerifyDataSource registerOtpVerifyDataSource,
  }) : _registerOtpVerifyDataSource = registerOtpVerifyDataSource;

  @override
  Future<Either<Failure, bool>> verifyOtp(
    RegisterOtpRequestModel registerOtpRequestModel,
  ) async {
    return await _registerOtpVerifyDataSource.verifyOtp(
      RegisterOtpRequestDto.fromDomain(registerOtpRequestModel),
    );
  }

  @override
  Future<Either<Failure, bool>> resendOtp(
    RegisterOtpResendRequestModel registerOtpResendRequestModel,
  ) async {
    return await _registerOtpVerifyDataSource.resendOtp(
      RegisterOtpResendRequestDto.fromDomain(registerOtpResendRequestModel),
    );
  }
}
