import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/failure.dart';
import 'package:e_buy/features/auth/domain/models/user.dart';
import 'package:e_buy/features/auth/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  bool get isUserLoggedIn {
    return _authRepository.getToken().isNotEmpty;
  }

  Either<Failure, User> getUserProfile() => _authRepository.getUserProfile();

  String getToken() => _authRepository.getToken();
}
