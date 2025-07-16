import 'package:e_buy/app/controllers/base_pagination_controller.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_item_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_query_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_create_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_item_remove_param_model.dart';
import 'package:e_buy/features/wish_list/domain/use_case/wish_list_use_case.dart';
import 'package:e_buy/features/wish_list/domain/use_case/wishlist_create_use_case.dart';
import 'package:e_buy/features/wish_list/domain/use_case/wishlist_remove_use_case.dart';

class WishListController
    extends BasePaginationController<WishListItemModel, WishListQueryModel> {
  final WishListUseCase _wishListUseCase;
  final WishlistRemoveUseCase _wishlistRemoveUseCase;
  final WishlistCreateUseCase _wishListCreateUseCase;

  WishListController({
    required WishListUseCase wishListUseCase,
    required WishlistRemoveUseCase wishlistRemoveUseCase,
    required WishlistCreateUseCase wishListCreateUseCase,
  }) : _wishListUseCase = wishListUseCase,
       _wishlistRemoveUseCase = wishlistRemoveUseCase,
       _wishListCreateUseCase = wishListCreateUseCase;

  String _addToWishlistErrorMessage = "";
  String get addToWishlistErrorMessage => _addToWishlistErrorMessage;

  @override
  Future<Either<Failure, Pagination<WishListItemModel>>> fetchPage(
    WishListQueryModel query,
  ) {
    return _wishListUseCase.getWishList(query: query);
  }

  Future<void> loadInitialData() async {
    await loadInitial(query: WishListQueryModel());
  }

  Future<bool> removeFromWishList(String id) async {
    _deleteItem(id);
    final result = await _wishlistRemoveUseCase.execute(
      model: WishlistItemRemoveParamModel(wishlistItemId: id),
    );
    return result.fold((l) => false, (r) => true);
  }

  Future<bool> addToWishlist({required String productId}) async {
    _addToWishlistErrorMessage = "";
    final result = await _wishListCreateUseCase.execute(
      body: WishListCreateBodyModel(productId: productId),
    );
    return result.fold((l) {
      _addToWishlistErrorMessage = l.message;
      return false;
    }, (r) => true);
  }

  void _deleteItem(String id) {
    list.removeWhere((element) => element.id == id);
    update();
  }
}
