import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/domain/models/category_model.dart';

abstract class CategoryRepository {
  Future<Either<Failure, Pagination<CategoryModel>>> getCategories({
    int page = 1,
    int limit = 10,
  });
}
