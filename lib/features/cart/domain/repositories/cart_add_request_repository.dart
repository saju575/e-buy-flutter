import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/cart/domain/models/cart_add_request_model.dart';

abstract class CartAddRequestRepository {
  Future<Either<Failure, bool>> addToCart(
    CartAddRequestModel cartAddRequestModel,
  );
}
