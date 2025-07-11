import 'package:e_buy/app/controllers/base_pagination_controller.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_query_model.dart';
import 'package:e_buy/features/product/domain/use_case/product_list_use_case.dart';

class NewProductListController
    extends BasePaginationController<ProductModel, ProductQueryModel> {
  final ProductListUseCase _productListUseCase;

  NewProductListController({required ProductListUseCase productListUseCase})
    : _productListUseCase = productListUseCase;

  @override
  Future<Either<Failure, Pagination<ProductModel>>> fetchPage(
    ProductQueryModel query,
  ) async {
    final result = await _productListUseCase.execute(query: query);
    print(
      "New Product controller ${result.fold((l) => l, (r) => r.list.length)}",
    );
    return result;
  }

  Future<void> loadInitialData() async {
    await loadInitial(query: ProductQueryModel(tag: "new"));
  }
}
