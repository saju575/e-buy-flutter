import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_params_model.dart';
import 'package:e_buy/features/product/domain/repositories/product_details_repository.dart';

class ProductDetailsUseCase {
  final ProductDetailsRepository _productDetailsRepository;
  ProductDetailsUseCase({
    required ProductDetailsRepository productDetailsRepository,
  }) : _productDetailsRepository = productDetailsRepository;

  Future<Either<Failure, ProductModel>> execute(ProductParamsModel params) {
    return _productDetailsRepository.getProductDetails(params);
  }
}
