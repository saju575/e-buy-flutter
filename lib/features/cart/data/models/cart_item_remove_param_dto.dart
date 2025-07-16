import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_remove_param_model.dart';

class CartItemRemoveParamDto extends UrlBuilderBaseModel {
  final String cartItemId;

  CartItemRemoveParamDto({required this.cartItemId});

  @override
  Map<String, dynamic> toJson() {
    return {"cart_item_id": cartItemId};
  }

  factory CartItemRemoveParamDto.fromDomain(CartItemRemoveParamModel model) {
    return CartItemRemoveParamDto(cartItemId: model.cartItemId);
  }
}
