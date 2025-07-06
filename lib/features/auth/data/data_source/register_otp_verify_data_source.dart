import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/auth/data/models/register_otp_request_dto.dart';
import 'package:e_buy/features/auth/data/models/register_otp_resend_request_dto.dart';

class RegisterOtpVerifyDataSource {
  final NetworkClientService _networkClientService;
  RegisterOtpVerifyDataSource({
    required NetworkClientService networkClientService,
  }) : _networkClientService = networkClientService;

  Future<Either<Failure, bool>> verifyOtp(
    RegisterOtpRequestDto registerOtpRequestDto,
  ) async {
    final response = await _networkClientService.post(
      ApiUrls.verifyOtp,
      registerOtpRequestDto.toJson(),
    );
    if (response.isSuccess) {
      return Right(true);
    } else {
      return Left(
        Failure(
          message: response.errorMessage ?? "",
          code: response.statusCode,
        ),
      );
    }
  }

  Future<Either<Failure, bool>> resendOtp(
    RegisterOtpResendRequestDto registerOtpResendRequestDto,
  ) async {
    final response = await _networkClientService.post(
      ApiUrls.resendOtp,
      registerOtpResendRequestDto.toJson(),
    );
    if (response.isSuccess) {
      return Right(true);
    } else {
      return Left(
        Failure(
          message: response.errorMessage ?? "",
          code: response.statusCode,
        ),
      );
    }
  }
}
