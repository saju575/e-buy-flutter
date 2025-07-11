import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/data/data_source/category_remote_data_source.dart';
import 'package:e_buy/features/product/domain/models/category_model.dart';
import 'package:e_buy/features/product/domain/repositories/category_repository.dart';

class CategoryRepositoryIml implements CategoryRepository {
  final CategoryRemoteDataSource _categoryRemoteDataSource;

  CategoryRepositoryIml({
    required CategoryRemoteDataSource categoryRemoteDataSource,
  }) : _categoryRemoteDataSource = categoryRemoteDataSource;

  @override
  Future<Either<Failure, Pagination<CategoryModel>>> getCategories({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _categoryRemoteDataSource.getCategories(
      page: page,
      limit: limit,
    );
    return response.fold((left) => Left(left), (right) {
      print("From category repository iml ${right.list.length}");
      return Right(
        right.toDomain(currentPage: page, mapper: (item) => item.toDomain()),
      );
    });
  }
}
