import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_item_remove_param_model.dart';
import 'package:e_buy/features/wish_list/domain/repositories/wish_list_repository.dart';

class WishlistRemoveUseCase {
  final WishListRepository _wishListRepository;
  WishlistRemoveUseCase({required WishListRepository wishListRepository})
    : _wishListRepository = wishListRepository;
  Future<Either<Failure, bool>> execute({
    required WishlistItemRemoveParamModel model,
  }) => _wishListRepository.removeFromWishList(model: model);
}
