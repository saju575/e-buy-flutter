import 'package:e_buy/features/auth/domain/models/login_request.dart';

class LoginRequestDto {
  final String email;
  final String password;

  LoginRequestDto({required this.email, required this.password});

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) {
    return LoginRequestDto(email: json['email'], password: json['password']);
  }

  factory LoginRequestDto.fromDomain(LoginRequest loginRequest) {
    return LoginRequestDto(
      email: loginRequest.email,
      password: loginRequest.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  LoginRequest toDomain() {
    return LoginRequest(email: email, password: password);
  }
}
