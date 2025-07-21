import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/order/domain/models/order_create_body_model.dart';
import 'package:e_buy/features/order/domain/repositories/order_repository.dart';

class OrderCreateUseCase {
  final OrderRepository _repository;
  OrderCreateUseCase({required OrderRepository repository})
    : _repository = repository;

  Future<Either<Failure, bool>> execute({
    required OrderShippingAddress address,
  }) => _repository.createOrder(
    OrderCreateBodyModel(shippingAddress: address, paymentMethod: "ssl"),
  );
}
