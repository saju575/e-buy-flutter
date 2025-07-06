import 'package:e_buy/features/auth/domain/models/login_request_model.dart';

class LoginRequestDto {
  final String email;
  final String password;

  LoginRequestDto({required this.email, required this.password});

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) {
    return LoginRequestDto(email: json['email'], password: json['password']);
  }

  factory LoginRequestDto.fromDomain(LoginRequestModel loginRequest) {
    return LoginRequestDto(
      email: loginRequest.email,
      password: loginRequest.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  LoginRequestModel toDomain() {
    return LoginRequestModel(email: email, password: password);
  }
}
