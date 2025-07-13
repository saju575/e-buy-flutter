import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_model.dart';
import 'package:e_buy/features/cart/domain/models/cart_query_model.dart';

abstract class CartRepository {
  Future<Either<Failure, Pagination<CartItemModel>>> getCartList({
    CartQueryModel? query,
  });
  // Future<void> addToCart(String productId);
  // Future<void> removeFromCart(String productId);
}
