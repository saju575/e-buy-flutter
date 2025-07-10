import 'package:e_buy/app/models/base_query.dart';

class ProductQueryModel extends BaseQuery<ProductQueryModel> {
  final String? category;
  final String? tag;

  ProductQueryModel({
    super.page = 1,
    super.count = 20,
    this.category,
    this.tag,
  });

  @override
  ProductQueryModel copyWith({
    int? page,
    int? count,
    String? category,
    String? tag,
  }) {
    return ProductQueryModel(
      page: page ?? this.page,
      count: count ?? this.count,
      category: category ?? this.category,
      tag: tag ?? this.tag,
    );
  }
}
