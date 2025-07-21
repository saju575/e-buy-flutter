import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/order/domain/models/order_create_body_model.dart';

abstract class OrderRepository {
  Future<Either<Failure, bool>> createOrder(OrderCreateBodyModel body);
}
