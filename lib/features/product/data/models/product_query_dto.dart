import 'package:e_buy/core/services/network/url_builder_service.dart';
import 'package:e_buy/features/product/domain/models/product_query_model.dart';

class ProductQueryDto extends UrlBuilderBaseModel {
  final int? page;
  final int? count;
  final String? category;
  final String? tag;

  ProductQueryDto({this.page, this.count, this.category, this.tag});

  factory ProductQueryDto.fromDomain(ProductQueryModel? query) {
    return ProductQueryDto(
      page: query?.page,
      count: query?.count,
      category: query?.category,
      tag: query?.tag,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {'page': page, 'count': count, 'category': category, 'tag': tag};
  }
}
