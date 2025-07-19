import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/reviews/domain/models/review_query_model.dart';

class ReviewQueryDto extends UrlBuilderBaseModel {
  final int? page;
  final int? count;
  final String? productId;

  ReviewQueryDto({this.page, this.count, required this.productId});

  factory ReviewQueryDto.fromDomain(ReviewQueryModel? query) {
    return ReviewQueryDto(
      page: query?.page,
      count: query?.count,
      productId: query?.productId,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'page': page, 'count': count, 'product': productId};
  }
}
