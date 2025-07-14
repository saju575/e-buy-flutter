import 'package:e_buy/app/controllers/base_pagination_controller.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_item_model.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_query_model.dart';
import 'package:e_buy/features/wish_list/domain/use_case/wish_list_use_case.dart';

class WishListController
    extends BasePaginationController<WishListItemModel, WishListQueryModel> {
  final WishListUseCase _wishListUseCase;

  WishListController({required WishListUseCase wishListUseCase})
    : _wishListUseCase = wishListUseCase;
  @override
  Future<Either<Failure, Pagination<WishListItemModel>>> fetchPage(
    WishListQueryModel query,
  ) {
    return _wishListUseCase.getWishList(query: query);
  }

  Future<void> loadInitialData() async {
    await loadInitial(query: WishListQueryModel());
  }
}
