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

  @override
  Future<Either<Failure, Pagination<CartItemModel>>> fetchPage(
    CartQueryModel query,
  ) async {
    return await _cartItemsUseCase.getList(query: query);
  }

  Future<void> loadInitialData() async {
    await loadInitial(query: CartQueryModel());
  }
}
