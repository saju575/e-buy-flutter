import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/failure.dart';
import 'package:e_buy/features/auth/data/data_source/login_data_source.dart';
import 'package:e_buy/features/auth/data/models/login_request_dto.dart';
import 'package:e_buy/features/auth/domain/models/user_model.dart';
import 'package:e_buy/features/auth/domain/repositories/login_repository.dart';

class LoginRepositoryIml implements LoginRepository {
  final LoginDataSource _loginDataSource;

  LoginRepositoryIml({required LoginDataSource loginDatasource})
    : _loginDataSource = loginDatasource;

  @override
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    final response = await _loginDataSource.login(
      LoginRequestDto(email: email, password: password),
    );
    return response.fold(
      (left) => Left(left),
      (right) => Right(UserModel.fromDto(right)),
    );
  }

  @override
  Future<void> logout() async {
    await _loginDataSource.clearUserData();
  }
}
