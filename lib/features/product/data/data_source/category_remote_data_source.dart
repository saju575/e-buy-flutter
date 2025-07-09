import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination_dto.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/product/data/models/category_dto.dart';

class CategoryRemoteDataSource {
  final NetworkClientService _networkClientService;

  CategoryRemoteDataSource({required NetworkClientService networkClientService})
    : _networkClientService = networkClientService;

  Future<Either<Failure, PaginationDto<CategoryDto>>> getCategories({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _networkClientService.get(
      ApiUrls.categoryListUrl(page, limit),
    );
    if (response.isSuccess) {
      return Right(
        PaginationDto<CategoryDto>.fromJson(
          response.data!["data"],
          (item) => CategoryDto.fromJson(item),
        ),
      );
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
