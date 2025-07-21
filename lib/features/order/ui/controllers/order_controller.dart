import 'package:e_buy/features/auth/ui/controllers/auth_controller.dart';
import 'package:e_buy/features/order/domain/models/order_create_body_model.dart';
import 'package:e_buy/features/order/domain/use_case/order_create_use_case.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final OrderCreateUseCase _orderCreateUseCase;
  final AuthController _authController;

  OrderController({
    required OrderCreateUseCase orderCreateUseCase,
    required AuthController authController,
  }) : _orderCreateUseCase = orderCreateUseCase,
       _authController = authController;

  bool _placeOrderLoading = false;
  String _placeOrderErrorMessage = "";
  bool get placeOrderLoading => _placeOrderLoading;
  String get placeOrderErrorMessage => _placeOrderErrorMessage;

  Future<bool> placeOrder({
    required String address,
    required String city,
    required String postalCode,
    required String phoneNumber,
  }) async {
    bool res = false;
    _placeOrderErrorMessage = "";
    _placeOrderLoading = true;
    update();
    final String fullName = _authController.getFullUserName();
    final result = await _orderCreateUseCase.execute(
      address: OrderShippingAddress(
        address: address,
        city: city,
        postalCode: int.parse(postalCode),
        phoneNumber: phoneNumber,
        fullName: fullName,
      ),
    );
    result.fold((l) {
      _placeOrderErrorMessage = l.message;
      res = false;
    }, (r) => res = true);
    _placeOrderLoading = false;
    update();
    return res;
  }
}
