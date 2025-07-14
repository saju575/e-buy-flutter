import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_item_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_query_model.dart';

abstract class WishListRepository {
  Future<Either<Failure, Pagination<WishListItemModel>>> getWishList({
    WishListQueryModel? query,
  });
}
