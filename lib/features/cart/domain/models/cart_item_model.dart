import 'package:e_buy/features/product/domain/models/product_model.dart';

class CartItemModel {
  final String id;
  final ProductModel? product;
  int quantity;
  final String? color;
  final String? size;

  CartItemModel({
    required this.id,
    required this.product,
    required this.quantity,
    this.color,
    this.size,
  });

  CartItemModel copyWith({
    String? id,
    ProductModel? product,
    int? quantity,
    String? color,
    String? size,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      color: color ?? this.color,
      size: size ?? this.size,
    );
  }
}
