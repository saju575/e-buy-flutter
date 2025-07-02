import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/failure.dart';
import 'package:e_buy/features/auth/domain/models/user.dart';
import 'package:e_buy/features/auth/domain/repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase({required LoginRepository loginRepository})
    : _loginRepository = loginRepository;

  Future<void> logout() => _loginRepository.logout();
  Future<Either<Failure, User>> login(String email, String password) async {
    return await _loginRepository.login(email, password);
  }
}
