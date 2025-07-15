import 'package:e_buy/features/wish_list/domain/models/wishlist_create_model.dart';

class WishListCreateBodyDto {
  final String productId;

  WishListCreateBodyDto({required this.productId});

  Map<String, dynamic> toJson() => {"product": productId};

  factory WishListCreateBodyDto.fromDomain({
    required WishListCreateBodyModel model,
  }) {
    return WishListCreateBodyDto(productId: model.productId);
  }
}
