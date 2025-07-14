import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/product/data/data_source/product_details_remote_data_source.dart';
import 'package:e_buy/features/product/data/models/product_params_dto.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_params_model.dart';
import 'package:e_buy/features/product/domain/repositories/product_details_repository.dart';

class ProductDetailsRepositoryIml implements ProductDetailsRepository {
  final ProductDetailsRemoteDataSource _productDetailsRemoteDataSource;
  ProductDetailsRepositoryIml({
    required ProductDetailsRemoteDataSource productDetailsRemoteDataSource,
  }) : _productDetailsRemoteDataSource = productDetailsRemoteDataSource;

  @override
  Future<Either<Failure, ProductModel>> getProductDetails(
    ProductParamsModel params,
  ) async {
    final response = await _productDetailsRemoteDataSource.getProductDetails(
      params: ProductParamsDto.fromDomain(params),
    );

    return response.fold((left) => Left(left), (right) {
      return Right(right.toDomain());
    });
  }
}
