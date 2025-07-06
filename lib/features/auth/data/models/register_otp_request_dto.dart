import 'package:e_buy/features/auth/domain/models/register_otp_request_model.dart';

class RegisterOtpRequestDto {
  final String email;
  final String otp;

  RegisterOtpRequestDto({required this.email, required this.otp});

  Map<String, dynamic> toJson() => {"email": email, "otp": otp};

  factory RegisterOtpRequestDto.fromDomain(RegisterOtpRequestModel model) {
    return RegisterOtpRequestDto(email: model.email, otp: model.otp);
  }
}
