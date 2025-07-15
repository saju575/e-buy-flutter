import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_create_model.dart';

abstract class WishlistCreateRepository {
  Future<Either<Failure, bool>> addToWishList({
    required WishListCreateBodyModel body,
  });
}
