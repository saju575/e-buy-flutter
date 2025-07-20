import 'package:e_buy/features/reviews/domain/models/review_create_body_model.dart';

class ReviewCreateBodyDto {
  final String comment;
  final int? rating;
  final String productId;

  ReviewCreateBodyDto({
    required this.comment,
    this.rating,
    required this.productId,
  });

  factory ReviewCreateBodyDto.fromDomain(ReviewCreateBodyModel model) {
    return ReviewCreateBodyDto(
      comment: model.comment,
      rating: model.rating,
      productId: model.productId,
    );
  }
  Map<String, dynamic> toJson() {
    return {"comment": comment, "rating": rating, "product": productId};
  }
}
