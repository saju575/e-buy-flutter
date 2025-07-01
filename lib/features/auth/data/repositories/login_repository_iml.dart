import 'package:e_buy/features/auth/data/datasources/login_data_source.dart';
import 'package:e_buy/features/auth/data/models/login_request_dto.dart';
import 'package:e_buy/features/auth/domain/models/user.dart';
import 'package:e_buy/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryIml implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryIml({required LoginDataSource loginDatasource})
    : _loginDataSource = loginDatasource;

  @override
  Future<User> login(String email, String password) async {
    try {
      final user = await _loginDataSource.login(
        LoginRequestDto(email: email, password: password),
      );
      return user.toDomain();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await _loginDataSource.clearUserData();
  }
}
