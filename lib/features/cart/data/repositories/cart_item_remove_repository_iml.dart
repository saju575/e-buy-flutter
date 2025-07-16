import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/cart/data/data_source/cart_item_remove_data_source.dart';
import 'package:e_buy/features/cart/data/models/cart_item_remove_param_dto.dart';
import 'package:e_buy/features/cart/domain/models/cart_item_remove_param_model.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_item_remove_repository.dart';

class CartItemRemoveRepositoryIml implements CartItemRemoveRepository {
  final CartItemRemoveDataSource cartItemRemoveDataSource;

  CartItemRemoveRepositoryIml({required this.cartItemRemoveDataSource});
  @override
  Future<Either<Failure, bool>> remove({
    required CartItemRemoveParamModel param,
  }) => cartItemRemoveDataSource.remove(
    param: CartItemRemoveParamDto.fromDomain(param),
  );
}
