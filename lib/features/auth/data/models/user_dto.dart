import 'package:e_buy/features/auth/domain/models/user_model.dart';

class UserDto {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String avatarUrl;
  final String city;

  UserDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.city,
  });

  factory UserDto.fromJson(Map<String, dynamic> jsonData) {
    return UserDto(
      id: jsonData['_id'],
      firstName: jsonData['first_name'] ?? '',
      lastName: jsonData['last_name'] ?? '',
      email: jsonData['email'] ?? "",
      phone: jsonData['phone'] ?? '',
      avatarUrl: jsonData['avatar_url'] ?? '',
      city: jsonData['city'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'avatar_url': avatarUrl,
      'city': city,
    };
  }

  UserModel toDomain() {
    return UserModel(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      avatarUrl: avatarUrl,
      city: city,
    );
  }
}
