import 'package:e_buy/features/auth/data/datasources/auth_data_source.dart';
import 'package:e_buy/features/auth/domain/models/user.dart';
import 'package:e_buy/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryIml implements AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryIml({required AuthDataSource authDataSource})
    : _authDataSource = authDataSource;

  @override
  User? getUserProfile() {
    final userProfile = _authDataSource.getUserData();
    if (userProfile != null) {
      return userProfile.toDomain();
    } else {
      return null;
    }
  }

  @override
  String getToken() {
    return _authDataSource.getToken();
  }
}
