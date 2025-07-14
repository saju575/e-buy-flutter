import 'package:e_buy/features/product/domain/models/product_model.dart';

class WishListItemModel {
  final String id;
  final ProductModel product;
  final String? userId;
  final String createdAt;
  final String updatedAt;

  WishListItemModel({
    required this.id,
    required this.product,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
}
