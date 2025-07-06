import 'package:equatable/equatable.dart';

class RegisterRequestModel extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String city;
  final String phone;

  const RegisterRequestModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.city,
    required this.phone,
  });

  RegisterRequestModel copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? city,
    String? phone,
  }) {
    return RegisterRequestModel(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
      city: city ?? this.city,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object?> get props => [
    email,
    firstName,
    lastName,
    password,
    city,
    phone,
  ];
}
