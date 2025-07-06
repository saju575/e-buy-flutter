import 'package:e_buy/app/models/either.dart';

import 'package:e_buy/features/auth/domain/models/register_request_model.dart';
import 'package:e_buy/features/auth/domain/repositories/register_repository.dart';

class RegisterUseCase {
  final RegisterRepository _registerRepository;

  RegisterUseCase({required RegisterRepository registerRepository})
    : _registerRepository = registerRepository;

  Future<Either<Failure, bool>> execute(
    RegisterRequestModel registerRequestModel,
  ) async => await _registerRepository.register(registerRequestModel);
}
