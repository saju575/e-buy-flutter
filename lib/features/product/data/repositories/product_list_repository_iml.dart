import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/data/data_source/product_list_remote_data_source.dart';
import 'package:e_buy/features/product/data/models/product_query_dto.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_query_model.dart';
import 'package:e_buy/features/product/domain/repositories/product_list_repository.dart';

class ProductListRepositoryIml implements ProductListRepository {
  final ProductListRemoteDateSource _productListRemoteDateSource;

  ProductListRepositoryIml({
    required ProductListRemoteDateSource productListRemoteDateSource,
  }) : _productListRemoteDateSource = productListRemoteDateSource;
  @override
  Future<Either<Failure, Pagination<ProductModel>>> getProductList({
    ProductQueryModel? query,
  }) async {
    final response = await _productListRemoteDateSource.getProductList(
      query: ProductQueryDto.fromDomain(query),
    );

    return response.fold((left) => Left(left), (right) {
      return Right(
        right.toDomain(
          currentPage: query?.page ?? 1,
          mapper: (item) => item.toDomain(),
        ),
      );
    });
  }
}
