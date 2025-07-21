import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/order/data/models/order_create_body_dto.dart';

class OrderRemoteDataSource {
  final NetworkClientService _networkClientService;

  OrderRemoteDataSource({required NetworkClientService networkClientService})
    : _networkClientService = networkClientService;

  Future<Either<Failure, bool>> createOrder({
    required OrderCreateBodyDto requestBody,
  }) async {
    final url = ApiUrls.order;
    final response = await _networkClientService.post(
      url,
      requestBody.toJson(),
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
