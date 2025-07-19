import 'package:e_buy/app/controllers/base_pagination_controller.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/domain/models/category_model.dart';
import 'package:e_buy/features/product/domain/models/category_query_model.dart';
import 'package:e_buy/features/product/domain/use_case/category_use_case.dart';

class CategoryController
    extends BasePaginationController<CategoryModel, CategoryQueryModel> {
  final CategoryUseCase _categoryUseCase;

  CategoryController({required CategoryUseCase categoryUseCase})
    : _categoryUseCase = categoryUseCase;

  @override
  Future<Either<Failure, Pagination<CategoryModel>>> fetchPage(
    CategoryQueryModel query,
  ) async {
    return await _categoryUseCase.getCategories(page: query.page, limit: 40);
  }

  Future<void> loadInitialData() async {
    await loadInitial(query: CategoryQueryModel());
  }
}
