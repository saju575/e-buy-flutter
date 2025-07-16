import 'package:e_buy/features/cart/domain/models/cart_item_remove_param_model.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_item_remove_use_case.dart';
import 'package:e_buy/features/cart/ui/controllers/cart_items_controller.dart';
import 'package:get/get.dart';

class CartItemRemoveController extends GetxController {
  final CartItemRemoveUseCase _cartItemRemoveUseCase;
  final CartItemsController _cartItemsController;

  CartItemRemoveController({
    required CartItemsController cartItemsController,
    required CartItemRemoveUseCase cartItemRemoveUseCase,
  }) : _cartItemRemoveUseCase = cartItemRemoveUseCase,
       _cartItemsController = cartItemsController;

  Future<void> removeItem(String cartItemId) async {
    _cartItemsController.removeItem(cartItemId);
    await _cartItemRemoveUseCase.execute(
      CartItemRemoveParamModel(cartItemId: cartItemId),
    );
  }
}
