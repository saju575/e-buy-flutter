import 'package:e_buy/features/cart/domain/models/cart_item_update_body_model.dart';

class CartItemUpdateBodyDto {
  final int quantity;

  CartItemUpdateBodyDto({required this.quantity});

  factory CartItemUpdateBodyDto.fromDomain(CartItemUpdateBodyModel body) {
    return CartItemUpdateBodyDto(quantity: body.quantity);
  }

  Map<String, dynamic> toJson() => {"quantity": quantity};
}
