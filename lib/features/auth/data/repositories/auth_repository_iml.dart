import 'package:e_buy/app/models/either.dart';

import 'package:e_buy/features/auth/data/data_source/auth_data_source.dart';
import 'package:e_buy/features/auth/domain/models/user_model.dart';
import 'package:e_buy/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryIml implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryIml({required AuthDataSource authDataSource})
    : _authDataSource = authDataSource;

  @override
  Either<Failure, UserModel> getUserProfile() {
    final userProfile = _authDataSource.getUserData();
    return userProfile.fold(
      (leftValue) => Left(leftValue),
      (rightValue) => Right(UserModel.fromDto(rightValue)),
    );
  }

  @override
  String getToken() {
    return _authDataSource.getToken();
  }
}
