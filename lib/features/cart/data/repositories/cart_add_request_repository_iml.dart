import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/cart/data/data_source/cart_add_request_data_source.dart';
import 'package:e_buy/features/cart/data/models/cart_add_request_dto.dart';
import 'package:e_buy/features/cart/domain/models/cart_add_request_model.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_add_request_repository.dart';

class CartAddRequestRepositoryIml extends CartAddRequestRepository {
  final CartAddRequestDataSource cartItemsRemoteDataSource;
  CartAddRequestRepositoryIml({required this.cartItemsRemoteDataSource});
  @override
  Future<Either<Failure, bool>> addToCart(CartAddRequestModel model) async {
    final response = await cartItemsRemoteDataSource.addToCart(
      requestBody: CartAddRequestDto.fromDomain(model: model),
    );

    return response.fold((left) => Left(left), (right) {
      return Right(right);
    });
  }
}
