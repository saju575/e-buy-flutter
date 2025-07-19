import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/reviews/domain/models/review_model.dart';
import 'package:e_buy/features/reviews/domain/models/review_query_model.dart';
import 'package:e_buy/features/reviews/domain/repositories/review_repository.dart';

class ReviewListUseCase {
  final ReviewRepository _repository;

  ReviewListUseCase({required ReviewRepository repository})
    : _repository = repository;

  Future<Either<Failure, Pagination<ReviewModel>>> execute({
    ReviewQueryModel? query,
  }) => _repository.getReviewList(query: query);
}
