import 'package:e_buy/features/cart/domain/models/cart_add_request_model.dart';

class CartAddRequestDto {
  final String productId;
  final int quantity;
  final String? color;
  final String? size;

  CartAddRequestDto({
    required this.productId,
    required this.quantity,
    this.color,
    this.size,
  });

  Map<String, dynamic> toJson() => {
    "product": productId,
    "quantity": quantity,
    "color": color,
    "size": size,
  };

  factory CartAddRequestDto.fromDomain({required CartAddRequestModel model}) {
    return CartAddRequestDto(
      productId: model.productId,
      quantity: model.quantity,
      color: model.color,
      size: model.size,
    );
  }
}
