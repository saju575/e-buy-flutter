import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/cart/domain/models/cart_add_request_model.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_repository.dart';

class CartAddRequestUseCase {
  final CartRepository _cartRepository;

  CartAddRequestUseCase({required CartRepository cartRepository})
    : _cartRepository = cartRepository;

  Future<Either<Failure, bool>> execute(
    CartAddRequestModel cartAddRequestModel,
  ) {
    return _cartRepository.addToCart(cartAddRequestModel);
  }
}
