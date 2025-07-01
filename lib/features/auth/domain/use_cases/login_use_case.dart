import 'package:e_buy/features/auth/domain/models/user.dart';
import 'package:e_buy/features/auth/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase({required LoginRepository loginRepository})
    : _loginRepository = loginRepository;

  Future<void> logout() => _loginRepository.logout();
  Future<User> login(String email, String password) async {
    try {
      return await _loginRepository.login(email, password);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
