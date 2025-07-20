import 'package:e_buy/app/controllers/base_pagination_controller.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/reviews/domain/models/review_create_body_model.dart';
import 'package:e_buy/features/reviews/domain/models/review_model.dart';
import 'package:e_buy/features/reviews/domain/models/review_query_model.dart';
import 'package:e_buy/features/reviews/domain/use_case/review_create_use_case.dart';
import 'package:e_buy/features/reviews/domain/use_case/review_list_use_case.dart';

class ReviewController
    extends BasePaginationController<ReviewModel, ReviewQueryModel> {
  final ReviewListUseCase _reviewListUseCase;
  final ReviewCreateUseCase _reviewCreateUseCase;

  ReviewController({
    required ReviewListUseCase reviewListUseCase,
    required ReviewCreateUseCase reviewCreateUseCase,
  }) : _reviewListUseCase = reviewListUseCase,
       _reviewCreateUseCase = reviewCreateUseCase;

  @override
  Future<Either<Failure, Pagination<ReviewModel>>> fetchPage(query) async {
    return await _reviewListUseCase.execute(query: query);
  }

  Future<void> loadInitialData(String productId) async {
    await resetBasedOnQuery(ReviewQueryModel(productId: productId, count: 30));
  }

  bool _reviewCreateLoading = false;
  String? _reviewCreateErrorMessage;

  bool get reviewCreateLoading => _reviewCreateLoading;

  String? get reviewCreateErrorMessage => _reviewCreateErrorMessage;

  Future<bool> createReview({
    required String productId,
    required String comment,
  }) async {
    bool isSuccess = false;
    _reviewCreateLoading = true;
    _reviewCreateErrorMessage = null;
    update();
    final response = await _reviewCreateUseCase.execute(
      body: ReviewCreateBodyModel(productId: productId, comment: comment),
    );
    response.fold(
      (left) {
        _reviewCreateErrorMessage = left.message;
        isSuccess = false;
      },
      (right) {
        isSuccess = true;
      },
    );
    await refreshData();
    _reviewCreateLoading = false;
    update();
    return isSuccess;
  }
}
