import 'package:e_buy/features/auth/domain/models/user_model.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';

class ReviewModel {
  final String id;
  final UserModel user;
  final ProductModel product;
  final num? rating;
  final String? comment;
  final String? createdAt;
  final String? updatedAt;

  ReviewModel({
    required this.id,
    required this.user,
    required this.product,
    this.rating,
    this.comment,
    this.createdAt,
    this.updatedAt,
  });
}
