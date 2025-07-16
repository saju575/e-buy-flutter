import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/cart/domain/models/cart_add_request_model.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_add_request_repository.dart';

class CartAddRequestUseCase {
  final CartAddRequestRepository cartAddRequestRepository;

  CartAddRequestUseCase({required this.cartAddRequestRepository});

  Future<Either<Failure, bool>> execute(
    CartAddRequestModel cartAddRequestModel,
  ) {
    return cartAddRequestRepository.addToCart(cartAddRequestModel);
  }
}
