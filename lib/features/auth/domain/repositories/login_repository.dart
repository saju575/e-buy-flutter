import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/failure.dart';
import 'package:e_buy/features/auth/domain/models/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> login(String email, String password);
  Future<void> logout();
}
