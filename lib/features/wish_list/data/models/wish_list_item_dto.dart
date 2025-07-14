import 'package:e_buy/features/product/data/models/product_dto.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_item_model.dart';

class WishListItemDto {
  final String id;
  final ProductDto product;
  final String? userId;
  final String createdAt;
  final String updatedAt;

  WishListItemDto({
    required this.id,
    required this.product,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WishListItemDto.fromJson(Map<String, dynamic> json) =>
      WishListItemDto(
        id: json["_id"],
        product: ProductDto.fromJson(json["product"]),
        userId: json["user"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  WishListItemModel toDomain() => WishListItemModel(
    id: id,
    product: product.toDomain(),
    userId: userId,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
