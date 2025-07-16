import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/wish_list/domain/models/wishlist_item_remove_param_model.dart';

class WishlistItemRemoveParamDto extends UrlBuilderBaseModel {
  final String wishlistItemId;
  WishlistItemRemoveParamDto({required this.wishlistItemId});

  factory WishlistItemRemoveParamDto.fromDomain({
    required WishlistItemRemoveParamModel model,
  }) => WishlistItemRemoveParamDto(wishlistItemId: model.wishlistItemId);

  @override
  Map<String, dynamic> toJson() => {"wishlist_item_id": wishlistItemId};
}
