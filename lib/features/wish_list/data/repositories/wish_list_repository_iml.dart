import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/wish_list/data/data_source/wish_list_remote_data_source.dart';
import 'package:e_buy/features/wish_list/data/models/wish_list_query_dto.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_item_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_query_model.dart';
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
}
