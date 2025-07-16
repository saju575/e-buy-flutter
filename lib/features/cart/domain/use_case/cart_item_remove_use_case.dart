import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_remove_param_model.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_repository.dart';

class CartItemRemoveUseCase {
  final CartRepository _cartRepository;

  CartItemRemoveUseCase({required CartRepository cartRepository})
    : _cartRepository = cartRepository;

  Future<Either<Failure, bool>> execute(CartItemRemoveParamModel param) {
    return _cartRepository.remove(param: param);
  }
}
