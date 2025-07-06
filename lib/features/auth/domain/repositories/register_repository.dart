import 'package:e_buy/app/models/either.dart';

import 'package:e_buy/features/auth/domain/models/register_request_model.dart';

abstract class RegisterRepository {
  Future<Either<Failure, bool>> register(
    RegisterRequestModel registerRequestModel,
  );
}
