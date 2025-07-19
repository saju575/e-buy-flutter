import 'package:e_buy/app/controllers/base_pagination_controller.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/reviews/domain/models/review_model.dart';
import 'package:e_buy/features/reviews/domain/models/review_query_model.dart';
import 'package:e_buy/features/reviews/domain/use_case/review_list_use_case.dart';

class ReviewController
    extends BasePaginationController<ReviewModel, ReviewQueryModel> {
  final ReviewListUseCase _reviewListUseCase;

  ReviewController({required ReviewListUseCase reviewListUseCase})
    : _reviewListUseCase = reviewListUseCase;

  @override
  Future<Either<Failure, Pagination<ReviewModel>>> fetchPage(query) async {
    return await _reviewListUseCase.execute(query: query);
  }

  Future<void> loadInitialData(String productId) async {
    await resetBasedOnQuery(ReviewQueryModel(productId: productId, count: 30));
  }
}
