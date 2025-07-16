import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_remove_param_model.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_item_remove_repository.dart';

class CartItemRemoveUseCase {
  final CartItemRemoveRepository cartItemRemoveRepository;

  CartItemRemoveUseCase({required this.cartItemRemoveRepository});

  Future<Either<Failure, bool>> execute(CartItemRemoveParamModel param) {
    return cartItemRemoveRepository.remove(param: param);
  }
}
