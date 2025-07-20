import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/reviews/domain/models/review_create_body_model.dart';
import 'package:e_buy/features/reviews/domain/repositories/review_repository.dart';

class ReviewCreateUseCase {
  final ReviewRepository _repository;

  ReviewCreateUseCase({required ReviewRepository repository})
    : _repository = repository;

  Future<Either<Failure, bool>> execute({
    required ReviewCreateBodyModel body,
  }) => _repository.createReview(body: body);
}
