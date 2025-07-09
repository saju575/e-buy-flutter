import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/domain/models/category_model.dart';
import 'package:e_buy/features/product/domain/repositories/category_repository.dart';

class CategoryUseCase {
  final CategoryRepository _categoryRepository;
  CategoryUseCase({required CategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository;
  Future<Either<Failure, Pagination<CategoryModel>>> getCategories({
    int page = 1,
    int limit = 10,
  }) => _categoryRepository.getCategories(page: page, limit: limit);
}
