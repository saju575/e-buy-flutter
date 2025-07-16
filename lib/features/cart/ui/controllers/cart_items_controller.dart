import 'package:e_buy/app/controllers/base_pagination_controller.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_model.dart';
import 'package:e_buy/features/cart/domain/models/cart_query_model.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_items_use_case.dart';

class CartItemsController
    extends BasePaginationController<CartItemModel, CartQueryModel> {
  final CartItemsUseCase _cartItemsUseCase;

  CartItemsController({required CartItemsUseCase cartItemsUseCase})
    : _cartItemsUseCase = cartItemsUseCase;

  double _total = 0;
  double get total {
    return _total;
  }

  @override
  Future<Either<Failure, Pagination<CartItemModel>>> fetchPage(
    CartQueryModel query,
  ) async {
    return await _cartItemsUseCase.getList(query: query);
  }

  Future<void> loadInitialData() async {
    await loadInitial(query: CartQueryModel());
  }

  void totalPrice() {
    _total = 0;
    for (CartItemModel cartItem in list) {
      _total += (cartItem.product?.currentPrice ?? 0 * cartItem.quantity);
    }
    update();
  }

  void updateQuantity(String cartItemId, int quantity) {
    for (CartItemModel cartItemModel in list) {
      if (cartItemModel.id == cartItemId) {
        cartItemModel.quantity = quantity;
        update();
        break;
      }
    }
  }

  void removeItem(String cartItemId) {
    for (CartItemModel cartItemModel in list) {
      if (cartItemModel.id == cartItemId) {
        list.remove(cartItemModel);
        update();
        break;
      }
    }
  }
}
