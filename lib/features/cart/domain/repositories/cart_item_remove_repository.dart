import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_remove_param_model.dart';

abstract class CartItemRemoveRepository {
  Future<Either<Failure, bool>> remove({
    required CartItemRemoveParamModel param,
  });
}
