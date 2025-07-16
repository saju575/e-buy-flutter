import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/cart/data/models/cart_add_request_dto.dart';

class CartAddRequestDataSource {
  final NetworkClientService _networkClientService;

  CartAddRequestDataSource({required NetworkClientService networkClientService})
    : _networkClientService = networkClientService;

  Future<Either<Failure, bool>> addToCart({
    required CartAddRequestDto requestBody,
  }) async {
    final url = ApiUrls.addToCart;
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
