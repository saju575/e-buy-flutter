import 'package:e_buy/features/auth/domain/models/user.dart';

abstract class LoginRepository {
  Future<User> login(String email, String password);
  Future<void> logout();
}
