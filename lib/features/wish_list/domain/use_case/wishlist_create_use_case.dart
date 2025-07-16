import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_create_model.dart';
import 'package:e_buy/features/wish_list/domain/repositories/wish_list_repository.dart';

class WishlistCreateUseCase {
  final WishListRepository _wishListRepository;

  WishlistCreateUseCase({required WishListRepository wishlistRepository})
    : _wishListRepository = wishlistRepository;

  Future<Either<Failure, bool>> execute({
    required WishListCreateBodyModel body,
  }) async {
    return await _wishListRepository.addToWishList(body: body);
  }
}
