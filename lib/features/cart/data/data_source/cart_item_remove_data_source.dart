import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/cart/data/models/cart_item_remove_param_dto.dart';

class CartItemRemoveDataSource {
  final NetworkClientService _networkClientService;

  CartItemRemoveDataSource({required NetworkClientService networkClientService})
    : _networkClientService = networkClientService;

  Future<Either<Failure, bool>> remove({
    required CartItemRemoveParamDto param,
  }) async {
    final url = UrlBuilderService(
      url: ApiUrls.removeFromCart,
      param: param,
    ).build();
    final response = await _networkClientService.delete(url);
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
