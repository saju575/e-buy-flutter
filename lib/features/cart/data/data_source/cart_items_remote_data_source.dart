import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination_dto.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/cart/data/models/cart_add_request_dto.dart';
import 'package:e_buy/features/cart/data/models/cart_item_dto.dart';
import 'package:e_buy/features/cart/data/models/cart_item_remove_param_dto.dart';
import 'package:e_buy/features/cart/data/models/cart_item_update_body_dto.dart';
import 'package:e_buy/features/cart/data/models/cart_item_update_param_dto.dart';
import 'package:e_buy/features/cart/data/models/cart_query_dto.dart';

class CartItemsRemoteDataSource {
  final NetworkClientService _networkClientService;

  CartItemsRemoteDataSource({
    required NetworkClientService networkClientService,
  }) : _networkClientService = networkClientService;

  Future<Either<Failure, PaginationDto<CartItemDto>>> getCartList({
    CartQueryDto? query,
  }) async {
    final url = UrlBuilderService(
      url: ApiUrls.cartItemList,
      query: query,
    ).build();
    final response = await _networkClientService.get(url);
    if (response.isSuccess) {
      return Right(
        PaginationDto<CartItemDto>.fromJson(
          response.data!["data"],
          (item) => CartItemDto.fromJson(item),
        ),
      );
    } else {
      return Left(
        Failure(
          message: response.errorMessage ?? "",
          code: response.statusCode,
        ),
      );
    }
  }

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

  Future<Either<Failure, bool>> updateCartItem({
    required CartItemUpdateParamDto param,
    required CartItemUpdateBodyDto body,
  }) async {
    final url = UrlBuilderService(
      url: ApiUrls.updateCartItem,
      param: param,
    ).build();

    final response = await _networkClientService.patch(url, body.toJson());
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
