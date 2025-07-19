import 'package:e_buy/app/controllers/base_pagination_controller.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_query_model.dart';
import 'package:e_buy/features/product/domain/use_case/product_list_use_case.dart';

class ProductListController
    extends BasePaginationController<ProductModel, ProductQueryModel> {
  final ProductListUseCase _productListUseCase;

  ProductListController({required ProductListUseCase productListUseCase})
    : _productListUseCase = productListUseCase;

  @override
  Future<Either<Failure, Pagination<ProductModel>>> fetchPage(
    ProductQueryModel query,
  ) async {
    return await _productListUseCase.execute(query: query);
  }

  Future<void> loadInitialData(String? tag, String? category) async {
    await resetBasedOnQuery(
      ProductQueryModel(tag: tag, category: category, count: 30),
    );
  }
}
