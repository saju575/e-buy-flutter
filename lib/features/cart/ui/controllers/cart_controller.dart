import 'package:e_buy/app/controllers/base_pagination_controller.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/cart/domain/models/cart_add_request_model.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_model.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_remove_param_model.dart';
import 'package:e_buy/features/cart/domain/models/cart_query_model.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_add_request_use_case.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_item_remove_use_case.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_item_update_use_case.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_items_use_case.dart';

class CartController
    extends BasePaginationController<CartItemModel, CartQueryModel> {
  final CartItemsUseCase _cartItemsUseCase;
  final CartItemRemoveUseCase _cartItemRemoveUseCase;
  final CartAddRequestUseCase _cartAddRequestUseCase;
  final CartItemUpdateUseCase _cartItemUpdateUseCase;

  CartController({
    required CartItemsUseCase cartItemsUseCase,
    required CartItemRemoveUseCase cartItemRemoveUseCase,
    required CartAddRequestUseCase cartAddRequestUseCase,
    required CartItemUpdateUseCase cartItemUpdateUseCase,
  }) : _cartItemsUseCase = cartItemsUseCase,
       _cartItemRemoveUseCase = cartItemRemoveUseCase,
       _cartAddRequestUseCase = cartAddRequestUseCase,
       _cartItemUpdateUseCase = cartItemUpdateUseCase;

  String _addToCartErrorMessage = "";
  bool _addToCartLoading = false;
  String get addToCartErrorMessage => _addToCartErrorMessage;
  bool get addToCartLoading => _addToCartLoading;

  @override
  Future<Either<Failure, Pagination<CartItemModel>>> fetchPage(
    CartQueryModel query,
  ) async {
    return await _cartItemsUseCase.getList(query: query);
  }

  Future<void> loadInitialData() async {
    await loadInitial(query: CartQueryModel());
  }

  Future<void> remove(String cartItemId) async {
    _removeItem(cartItemId);
    await _cartItemRemoveUseCase.execute(
      CartItemRemoveParamModel(cartItemId: cartItemId),
    );
  }

  void _updateCartItemQuantity(String cartItemId, int quantity) {
    _cartItemUpdateUseCase.execute(cartItemId: cartItemId, quantity: quantity);
  }

  void updateQuantity(String cartItemId, int quantity) {
    for (CartItemModel cartItemModel in list) {
      if (cartItemModel.id == cartItemId) {
        cartItemModel.quantity = quantity;
        update();
        _updateCartItemQuantity(cartItemId, quantity);
        break;
      }
    }
  }

  void _removeItem(String cartItemId) {
    for (CartItemModel cartItemModel in list) {
      if (cartItemModel.id == cartItemId) {
        list.remove(cartItemModel);
        update();
        break;
      }
    }
  }

  Future<bool> addToCart({required CartAddRequestModel requestBody}) async {
    _addToCartErrorMessage = "";
    _addToCartLoading = true;
    update();
    final result = await _cartAddRequestUseCase.execute(requestBody);
    final res = result.fold((l) {
      _addToCartErrorMessage = l.message;
      return false;
    }, (r) => true);
    _addToCartLoading = false;

    update();
    return res;
  }

  double get totalPrice {
    double total = 0;
    for (CartItemModel cartItem in list) {
      total += (cartItem.product?.currentPrice ?? 0) * cartItem.quantity;
    }

    return total;
  }
}
