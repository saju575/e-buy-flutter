import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_update_body_model.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_update_param_model.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_repository.dart';

class CartItemUpdateUseCase {
  final CartRepository _cartRepository;

  CartItemUpdateUseCase({required CartRepository cartRepository})
    : _cartRepository = cartRepository;

  Future<Either<Failure, bool>> execute({
    required String cartItemId,
    required int quantity,
  }) {
    return _cartRepository.updateCartItem(
      param: CartItemUpdateParamModel(cartItemId: cartItemId),
      body: CartItemUpdateBodyModel(quantity: quantity),
    );
  }
}
