import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination_dto.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/product/data/models/product_dto.dart';
import 'package:e_buy/features/product/data/models/product_query_dto.dart';

class ProductListRemoteDateSource {
  final NetworkClientService _networkClientService;

  ProductListRemoteDateSource({
    required NetworkClientService networkClientService,
  }) : _networkClientService = networkClientService;

  Future<Either<Failure, PaginationDto<ProductDto>>> getProducts({
    ProductQueryDto? query,
  }) async {
    final url = UrlBuilderService(url: ApiUrls.products, query: query).build();
    final response = await _networkClientService.get(url);
    // if (response.isSuccess) {
    //   return Right(
    //     PaginationDto<ProductDto>.fromJson(
    //       response.data!["data"],
    //       (item) => ProductDto.fromJson(item),
    //     ),
    //   );
    // } else {
    //   return Left(
    //     Failure(
    //       message: response.errorMessage ?? "",
    //       code: response.statusCode,
    //     ),
    //   );
    // }

    if (response.isSuccess) {
      final res = PaginationDto<ProductDto>.fromJson(
        response.data!["data"],
        (item) => ProductDto.fromJson(item),
      );
      print("Test -> ${res.list.length}");
      return Right(res);
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
