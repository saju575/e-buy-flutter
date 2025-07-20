import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/reviews/domain/models/review_create_body_model.dart';
import 'package:e_buy/features/reviews/domain/models/review_model.dart';
import 'package:e_buy/features/reviews/domain/models/review_query_model.dart';

abstract class ReviewRepository {
  Future<Either<Failure, Pagination<ReviewModel>>> getReviewList({
    ReviewQueryModel? query,
  });

  Future<Either<Failure, bool>> createReview({
    required ReviewCreateBodyModel body,
  });
}
