import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/cart/domain/models/cart_query_model.dart';

class CartQueryDto extends UrlBuilderBaseModel {
  final int? page;
  final int? count;

  CartQueryDto({this.page, this.count});

  factory CartQueryDto.fromDomain(CartQueryModel? query) {
    return CartQueryDto(page: query?.page, count: query?.count);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'page': page, 'count': count};
  }
}
