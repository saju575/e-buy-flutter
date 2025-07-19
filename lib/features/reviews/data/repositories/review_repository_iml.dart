import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/reviews/data/data-source/review_remote_data_source.dart';
import 'package:e_buy/features/reviews/data/models/review_query_dto.dart';
import 'package:e_buy/features/reviews/domain/models/review_model.dart';
import 'package:e_buy/features/reviews/domain/models/review_query_model.dart';
import 'package:e_buy/features/reviews/domain/repositories/review_repository.dart';

class ReviewRepositoryIml implements ReviewRepository {
  final ReviewRemoteDataSource _reviewRemoteDataSource;

  ReviewRepositoryIml({required ReviewRemoteDataSource reviewRemoteDataSource})
    : _reviewRemoteDataSource = reviewRemoteDataSource;
  @override
  Future<Either<Failure, Pagination<ReviewModel>>> getReviewList({
    ReviewQueryModel? query,
  }) async {
    final response = await _reviewRemoteDataSource.getReviewList(
      query: ReviewQueryDto.fromDomain(query),
    );

    return response.fold((left) => Left(left), (right) {
      return Right(
        right.toDomain(
          currentPage: query?.page ?? 1,
          mapper: (item) => item.toDomain(),
        ),
      );
    });
  }
}
