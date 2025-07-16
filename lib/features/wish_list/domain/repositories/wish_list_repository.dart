import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_item_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_query_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_create_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_item_remove_param_model.dart';

abstract class WishListRepository {
  Future<Either<Failure, Pagination<WishListItemModel>>> getWishList({
    WishListQueryModel? query,
  });

  Future<Either<Failure, bool>> removeFromWishList({
    required WishlistItemRemoveParamModel model,
  });

  Future<Either<Failure, bool>> addToWishList({
    required WishListCreateBodyModel body,
  });
}
