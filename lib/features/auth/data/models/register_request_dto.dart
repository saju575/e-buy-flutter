import 'package:e_buy/features/auth/domain/models/register_request_model.dart';

class RegisterRequestDto {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String city;
  final String phone;

  RegisterRequestDto({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": phone,
      "city": city,
    };
  }

  RegisterRequestModel toDomain() {
    return RegisterRequestModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
      city: city,
      phone: phone,
    );
  }

  factory RegisterRequestDto.fromDomain(
    RegisterRequestModel registerRequestModel,
  ) {
    return RegisterRequestDto(
      email: registerRequestModel.email,
      firstName: registerRequestModel.firstName,
      lastName: registerRequestModel.lastName,
      password: registerRequestModel.password,
      city: registerRequestModel.city,
      phone: registerRequestModel.phone,
    );
  }
}
