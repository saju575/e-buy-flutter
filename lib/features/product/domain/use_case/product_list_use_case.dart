import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_query_model.dart';
import 'package:e_buy/features/product/domain/repositories/product_list_repository.dart';

class ProductListUseCase {
  final ProductListRepository _productRepository;

  ProductListUseCase({required ProductListRepository productListRepository})
    : _productRepository = productListRepository;

  Future<Either<Failure, Pagination<ProductModel>>> execute({
    ProductQueryModel? query,
  }) => _productRepository.getProducts(query: query);
}
