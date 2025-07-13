import 'package:e_buy/app/models/base_query.dart';

class CartQueryModel extends BaseQuery<CartQueryModel> {
  CartQueryModel({super.page = 1, super.count = 20});

  @override
  CartQueryModel copyWith({int? page, int? count}) {
    return CartQueryModel(page: page ?? this.page, count: count ?? this.count);
  }
}
