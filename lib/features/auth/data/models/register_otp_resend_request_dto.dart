import 'package:e_buy/features/auth/domain/models/register_otp_resend_request_model.dart';

class RegisterOtpResendRequestDto {
  final String email;
  RegisterOtpResendRequestDto({required this.email});

  Map<String, dynamic> toJson() => {"email": email};

  factory RegisterOtpResendRequestDto.fromDomain(
    RegisterOtpResendRequestModel registerOtpResendRequestModel,
  ) {
    return RegisterOtpResendRequestDto(
      email: registerOtpResendRequestModel.email,
    );
  }
}
