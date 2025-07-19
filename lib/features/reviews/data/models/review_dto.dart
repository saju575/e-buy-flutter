import 'package:e_buy/features/auth/data/models/user_dto.dart';
import 'package:e_buy/features/product/data/models/product_dto.dart';
import 'package:e_buy/features/reviews/domain/models/review_model.dart';

class ReviewDto {
  final String id;
  final UserDto user;
  final ProductDto product;
  final num? rating;
  final String? comment;
  final String? createdAt;
  final String? updatedAt;

  ReviewDto({
    required this.id,
    required this.user,
    required this.product,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });

  factory ReviewDto.fromJson(Map<String, dynamic> json) => ReviewDto(
    id: json["_id"],
    user: UserDto.fromJson(json["user"]),
    product: ProductDto.fromJson(json["product"]),
    rating: json["rating"],
    comment: json["comment"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  ReviewModel toDomain() {
    return ReviewModel(
      id: id,
      user: user.toDomain(),
      product: product.toDomain(),
      rating: rating,
      comment: comment,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
