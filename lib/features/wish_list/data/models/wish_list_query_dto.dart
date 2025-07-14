import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/wish_list/domain/models/wish_list_query_model.dart';

class WishListQueryDto extends UrlBuilderBaseModel {
  final int? page;
  final int? count;

  WishListQueryDto({this.page, this.count});
  @override
  Map<String, dynamic> toJson() {
    return {'page': page, 'count': count};
  }

  factory WishListQueryDto.fromDomain(WishListQueryModel? query) {
    return WishListQueryDto(page: query?.page, count: query?.count);
  }
}
