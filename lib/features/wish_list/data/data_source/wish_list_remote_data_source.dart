import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination_dto.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/wish_list/data/models/wish_list_item_dto.dart';
import 'package:e_buy/features/wish_list/data/models/wish_list_query_dto.dart';
import 'package:e_buy/features/wish_list/data/models/wishlist_create_body_dto.dart';
import 'package:e_buy/features/wish_list/data/models/wishlist_item_remove_param_dto.dart';

class WishListRemoteDataSource {
  final NetworkClientService _networkClientService;

  WishListRemoteDataSource({required NetworkClientService networkClientService})
    : _networkClientService = networkClientService;

  Future<Either<Failure, PaginationDto<WishListItemDto>>> getWishList({
    WishListQueryDto? query,
  }) async {
    final url = UrlBuilderService(url: ApiUrls.wishList, query: query).build();
    final response = await _networkClientService.get(url);
    if (response.isSuccess) {
      return Right(
        PaginationDto<WishListItemDto>.fromJson(
          response.data!["data"],
          (item) => WishListItemDto.fromJson(item),
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

  Future<Either<Failure, bool>> addToWishList({
    required WishListCreateBodyDto body,
  }) {
    return _networkClientService.post(ApiUrls.wishList, body.toJson()).then((
      response,
    ) {
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
    });
  }

  Future<Either<Failure, bool>> removeWishListItem({
    required WishlistItemRemoveParamDto model,
  }) {
    final url = UrlBuilderService(
      url: ApiUrls.removeFromWishList,
      param: model,
    ).build();
    return _networkClientService.delete(url).then((response) {
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
    });
  }
}
