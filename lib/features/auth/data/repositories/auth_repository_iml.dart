import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/failure.dart';
import 'package:e_buy/features/auth/data/datasources/auth_data_source.dart';
import 'package:e_buy/features/auth/domain/models/user.dart';
import 'package:e_buy/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryIml implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryIml({required AuthDataSource authDataSource})
    : _authDataSource = authDataSource;

  @override
  Either<Failure, User> getUserProfile() {
    final userProfile = _authDataSource.getUserData();
    return userProfile.fold(
      (leftValue) => Left(leftValue),
      (rightValue) => Right(rightValue.toDomain()),
    );
  }

  @override
  String getToken() {
    return _authDataSource.getToken();
  }
}
