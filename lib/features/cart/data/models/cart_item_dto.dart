import 'package:e_buy/features/cart/domain/models/cart_item_model.dart';
import 'package:e_buy/features/product/data/models/product_dto.dart';

class CartItemDto {
  final String id;
  final ProductDto productDto;
  final int quantity;
  final String? color;
  final String? size;

  CartItemDto({
    required this.id,
    required this.productDto,
    required this.quantity,
    this.color,
    this.size,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> jsonData) {
    return CartItemDto(
      id: jsonData['_id'],
      productDto: ProductDto.fromJson(jsonData['product']),
      quantity: jsonData['quantity'] ?? 0,
      color: jsonData['color'],
      size: jsonData['size'],
    );
  }

  CartItemDto copyWith({
    String? id,
    ProductDto? productDto,
    int? quantity,
    String? color,
    String? size,
  }) {
    return CartItemDto(
      id: id ?? this.id,
      productDto: productDto ?? this.productDto,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }

  CartItemModel toDomain() {
    return CartItemModel(
      id: id,
      productModel: productDto.toDomain(),
      quantity: quantity,
      color: color,
      size: size,
    );
  }
}
