import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_model.dart';
import 'package:e_buy/features/cart/domain/models/cart_query_model.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_repository.dart';

class CartItemsUseCase {
  final CartRepository _cartRepository;
  CartItemsUseCase({required CartRepository cartRepository})
    : _cartRepository = cartRepository;

  Future<Either<Failure, Pagination<CartItemModel>>> getList({
    CartQueryModel? query,
  }) => _cartRepository.getCartList(query: query);
}
