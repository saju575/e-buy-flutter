import 'package:e_buy/app/models/base_query.dart';

class CategoryQueryModel extends BaseQuery<CategoryQueryModel> {
  CategoryQueryModel({super.page = 1, super.count = 30});

  @override
  CategoryQueryModel copyWith({int? page, int? count}) {
    return CategoryQueryModel(
      page: page ?? this.page,
      count: count ?? this.count,
    );
  }
}
