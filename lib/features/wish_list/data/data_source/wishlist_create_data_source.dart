import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/wish_list/data/models/wishlist_create_body_dto.dart';

class WishlistCreateDataSource {
  final NetworkClientService _networkClientService;

  WishlistCreateDataSource({required NetworkClientService networkClientService})
    : _networkClientService = networkClientService;

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
}
