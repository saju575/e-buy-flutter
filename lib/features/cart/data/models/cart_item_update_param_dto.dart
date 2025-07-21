import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_update_param_model.dart';

class CartItemUpdateParamDto extends UrlBuilderBaseModel {
  final String cartItemId;

  CartItemUpdateParamDto({required this.cartItemId});

  @override
  Map<String, dynamic> toJson() {
    return {"cart_item_id": cartItemId};
  }

  factory CartItemUpdateParamDto.fromDomain(CartItemUpdateParamModel model) {
    return CartItemUpdateParamDto(cartItemId: model.cartItemId);
  }
}
