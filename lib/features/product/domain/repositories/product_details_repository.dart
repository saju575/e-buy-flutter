import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_params_model.dart';

abstract class ProductDetailsRepository {
  Future<Either<Failure, ProductModel>> getProductDetails(
    ProductParamsModel params,
  );
}
