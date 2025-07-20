import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination_dto.dart';
import 'package:e_buy/app/routes/api_urls.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/reviews/data/models/review_create_body_dto.dart';
import 'package:e_buy/features/reviews/data/models/review_dto.dart';
import 'package:e_buy/features/reviews/data/models/review_query_dto.dart';

class ReviewRemoteDataSource {
  final NetworkClientService _networkClientService;

  ReviewRemoteDataSource({required NetworkClientService networkClientService})
    : _networkClientService = networkClientService;

  Future<Either<Failure, PaginationDto<ReviewDto>>> getReviewList({
    ReviewQueryDto? query,
  }) async {
    final url = UrlBuilderService(url: ApiUrls.reviews, query: query).build();
    final response = await _networkClientService.get(url);
    if (response.isSuccess) {
      return Right(
        PaginationDto<ReviewDto>.fromJson(
          response.data!["data"],
          (item) => ReviewDto.fromJson(item),
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

  Future<Either<Failure, bool>> createReview({
    required ReviewCreateBodyDto body,
  }) async {
    final url = UrlBuilderService(url: ApiUrls.reviews).build();
    final response = await _networkClientService.post(url, body.toJson());
    if (response.isSuccess) {
      // return Right(ReviewDto.fromJson(response.data!["data"]));
      return Right(true);
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
