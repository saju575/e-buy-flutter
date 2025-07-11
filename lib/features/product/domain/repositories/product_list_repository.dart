import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_query_model.dart';

abstract class ProductListRepository {
  Future<Either<Failure, Pagination<ProductModel>>> getProductList({
    ProductQueryModel? query,
  });
}
