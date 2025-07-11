import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/data/data_source/product_list_remote_date_source.dart';
import 'package:e_buy/features/product/data/models/product_query_dto.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_query_model.dart';
import 'package:e_buy/features/product/domain/repositories/product_list_repository.dart';

class ProductListRepositoryIml implements ProductListRepository {
  final ProductListRemoteDateSource _productRemoteDateSource;

  ProductListRepositoryIml({
    required ProductListRemoteDateSource productListRemoteDateSource,
  }) : _productRemoteDateSource = productListRemoteDateSource;

  @override
  Future<Either<Failure, Pagination<ProductModel>>> getProducts({
    ProductQueryModel? query,
  }) async {
    final response = await _productRemoteDateSource.getProducts(
      query: ProductQueryDto.fromDomain(query),
    );
    print("From repository iml");
    return response.fold(
      (left) {
        print("From repository ${left.message}");
        return Left(left);
      },
      (right) {
        print("From repository ${right.list.length}");
        return Right(
          right.toDomain(
            currentPage: query?.page ?? 1,
            mapper: (item) => item.toDomain(),
          ),
        );
      },
    );
  }
}
