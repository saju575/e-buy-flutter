import 'package:e_buy/app/models/either.dart';

import 'package:e_buy/features/auth/data/data_source/register_data_source.dart';
import 'package:e_buy/features/auth/data/models/register_request_dto.dart';
import 'package:e_buy/features/auth/domain/models/register_request_model.dart';
import 'package:e_buy/features/auth/domain/repositories/register_repository.dart';

class RegisterRepositoryIml implements RegisterRepository {
  final RegisterDataSource _registerDataSource;
  RegisterRepositoryIml({required RegisterDataSource registerDataSource})
    : _registerDataSource = registerDataSource;

  @override
  Future<Either<Failure, bool>> register(
    RegisterRequestModel registerRequestModel,
  ) async {
    final response = await _registerDataSource.register(
      RegisterRequestDto.fromDomain(registerRequestModel),
    );
    return response.fold((left) => Left(left), (right) => Right(right));
  }
}
