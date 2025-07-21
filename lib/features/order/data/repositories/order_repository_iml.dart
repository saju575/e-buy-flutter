import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/features/order/data/data_source/order_remote_data_source.dart';
import 'package:e_buy/features/order/data/models/order_create_body_dto.dart';
import 'package:e_buy/features/order/domain/models/order_create_body_model.dart';
import 'package:e_buy/features/order/domain/repositories/order_repository.dart';

class OrderRepositoryIml implements OrderRepository {
  final OrderRemoteDataSource _orderRemoteDataSource;

  OrderRepositoryIml({required OrderRemoteDataSource orderRemoteDataSource})
    : _orderRemoteDataSource = orderRemoteDataSource;
  @override
  Future<Either<Failure, bool>> createOrder(OrderCreateBodyModel body) async {
    final response = await _orderRemoteDataSource.createOrder(
      requestBody: OrderCreateBodyDto.fromDomain(body),
    );

    return response.fold((left) => Left(left), (right) => Right(right));
  }
}
