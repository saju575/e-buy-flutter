import 'package:e_buy/app/models/base_query.dart';

class ReviewQueryModel extends BaseQuery<ReviewQueryModel> {
  final String productId;

  ReviewQueryModel({required this.productId, super.page = 1, super.count = 30});

  @override
  ReviewQueryModel copyWith({int? page, int? count, String? productId}) {
    return ReviewQueryModel(
      page: page ?? this.page,
      count: count ?? this.count,
      productId: productId ?? this.productId,
    );
  }
}
