import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/wish_list/data/data_source/wishlist_create_data_source.dart';
import 'package:e_buy/features/wish_list/data/models/wishlist_create_body_dto.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_create_model.dart';
import 'package:e_buy/features/wish_list/domain/repositories/wishlist_create_repository.dart';

class WishlistCreateRepositoryIml implements WishlistCreateRepository {
  final WishlistCreateDataSource _wishlistCreateDataSource;

  WishlistCreateRepositoryIml({
    required WishlistCreateDataSource wishlistCreateDataSource,
  }) : _wishlistCreateDataSource = wishlistCreateDataSource;

  @override
  Future<Either<Failure, bool>> addToWishList({
    required WishListCreateBodyModel body,
  }) async {
    final response = await _wishlistCreateDataSource.addToWishList(
      body: WishListCreateBodyDto.fromDomain(model: body),
    );

    return response.fold((l) => Left(l), (r) => Right(r));
  }
}
