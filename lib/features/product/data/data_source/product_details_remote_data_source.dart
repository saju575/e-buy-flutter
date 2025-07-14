import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/product/data/models/product_dto.dart';
import 'package:e_buy/features/product/data/models/product_params_dto.dart';

class ProductDetailsRemoteDataSource {
  final NetworkClientService _networkClientService;

  ProductDetailsRemoteDataSource({
    required NetworkClientService networkClientService,
  }) : _networkClientService = networkClientService;

  Future<Either<Failure, ProductDto>> getProductDetails({
    required ProductParamsDto params,
  }) async {
    final url = UrlBuilderService(
      url: ApiUrls.productDetails,
      param: params,
    ).build();
    final response = await _networkClientService.get(url);
    if (response.isSuccess) {
      return Right(ProductDto.fromJson(response.data!["data"]));
    } else {
      return Left(
        Failure(
          message: response.errorMessage ?? "",
          code: response.statusCode,
        ),
      );
    }
  }
}
