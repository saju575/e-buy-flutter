import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/failure.dart';
import 'package:e_buy/features/auth/domain/models/user_model.dart';

abstract class AuthRepository {
  Either<Failure, UserModel> getUserProfile();
  String getToken();
}
