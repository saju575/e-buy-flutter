import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/failure.dart';
import 'package:e_buy/app/models/pagination_dto.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/home/data/models/slide_dto.dart';

class SlideRemoteDataSource {
  final NetworkClientService _networkClientService;

  SlideRemoteDataSource({required NetworkClientService networkClientService})
    : _networkClientService = networkClientService;

  Future<Either<Failure, PaginationDto<SlideDto>>> getSlides({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _networkClientService.get(ApiUrls.slides);
    if (response.isSuccess) {
      return Right(
        PaginationDto<SlideDto>.fromJson(
          response.data!["data"],
          (item) => SlideDto.fromJson(item),
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
