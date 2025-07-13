import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/cart/data/data_source/cart_items_remote_data_source.dart';
import 'package:e_buy/features/cart/data/models/cart_query_dto.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_model.dart';
import 'package:e_buy/features/cart/domain/models/cart_query_model.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryIml implements CartRepository {
  final CartItemsRemoteDataSource _cartItemsRemoteDataSource;

  CartRepositoryIml({
    required CartItemsRemoteDataSource cartItemsRemoteDataSource,
  }) : _cartItemsRemoteDataSource = cartItemsRemoteDataSource;

  @override
  Future<Either<Failure, Pagination<CartItemModel>>> getCartList({
    CartQueryModel? query,
  }) async {
    final response = await _cartItemsRemoteDataSource.getCartList(
      query: CartQueryDto.fromDomain(query),
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
