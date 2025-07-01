import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String avatarUrl;
  final String city;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.city,
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    email,
    phone,
    avatarUrl,
    city,
  ];
}
