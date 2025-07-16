import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/wish_list/data/data_source/wish_list_remote_data_source.dart';
import 'package:e_buy/features/wish_list/data/models/wish_list_query_dto.dart';
import 'package:e_buy/features/wish_list/data/models/wishlist_create_body_dto.dart';
import 'package:e_buy/features/wish_list/data/models/wishlist_item_remove_param_dto.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_item_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_query_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_create_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_item_remove_param_model.dart';
import 'package:e_buy/features/wish_list/domain/repositories/wish_list_repository.dart';

class WishListRepositoryIml implements WishListRepository {
  final WishListRemoteDataSource _wishListRemoteDataSource;

  WishListRepositoryIml({
    required WishListRemoteDataSource wishListRemoteDataSource,
  }) : _wishListRemoteDataSource = wishListRemoteDataSource;

  @override
  Future<Either<Failure, Pagination<WishListItemModel>>> getWishList({
    WishListQueryModel? query,
  }) async {
    final response = await _wishListRemoteDataSource.getWishList(
      query: WishListQueryDto.fromDomain(query),
    );

    return response.fold((left) => Left(left), (right) {
      return Right(
        right.toDomain(
          currentPage: query?.page ?? 1,
          mapper: (item) => item.toDomain(),
        ),
      );
    });
  }

  @override
  Future<Either<Failure, bool>> removeFromWishList({
    required WishlistItemRemoveParamModel model,
  }) async {
    final response = await _wishListRemoteDataSource.removeWishListItem(
      model: WishlistItemRemoveParamDto.fromDomain(model: model),
    );
    return response.fold((left) => Left(left), (right) => Right(right));
  }

  @override
  Future<Either<Failure, bool>> addToWishList({
    required WishListCreateBodyModel body,
  }) async {
    final response = await _wishListRemoteDataSource.addToWishList(
      body: WishListCreateBodyDto.fromDomain(model: body),
    );

    return response.fold((l) => Left(l), (r) => Right(r));
  }
}
