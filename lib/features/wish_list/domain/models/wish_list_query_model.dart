import 'package:e_buy/app/models/base_query.dart';

class WishListQueryModel extends BaseQuery<WishListQueryModel> {
  WishListQueryModel({super.page = 1, super.count = 20});

  @override
  copyWith({int? page, int? count}) {
    return WishListQueryModel(
      page: page ?? this.page,
      count: count ?? this.count,
    );
  }
}
