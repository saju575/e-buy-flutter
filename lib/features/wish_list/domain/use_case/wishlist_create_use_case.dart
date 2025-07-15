import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_create_model.dart';
import 'package:e_buy/features/wish_list/domain/repositories/wishlist_create_repository.dart';

class WishlistCreateUseCase {
  final WishlistCreateRepository wishlistCreateRepository;

  WishlistCreateUseCase({required this.wishlistCreateRepository});

  Future<Either<Failure, bool>> execute({
    required WishListCreateBodyModel body,
  }) async {
    return await wishlistCreateRepository.addToWishList(body: body);
  }
}
