import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/auth/data/models/register_request_dto.dart';

class RegisterDataSource {
  final NetworkClientService _networkClientService;

  RegisterDataSource({required NetworkClientService networkClientService})
    : _networkClientService = networkClientService;

  Future<Either<Failure, bool>> register(
    RegisterRequestDto registerRequestDto,
  ) async {
    final response = await _networkClientService.post(
      ApiUrls.signUp,
      registerRequestDto.toJson(),
    );
    if (response.isSuccess) {
      return Right(true);
    } else {
      return Left(
        Failure(
          message: response.errorMessage ?? "",
          code: response.statusCode,
        ),
      );
    }
  }
}
