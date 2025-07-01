import 'package:e_buy/features/auth/domain/models/user.dart';

abstract class AuthRepository {
  User? getUserProfile();
  String getToken();
}
