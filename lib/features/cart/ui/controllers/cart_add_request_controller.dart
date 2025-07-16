import 'package:e_buy/features/cart/domain/models/cart_add_request_model.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_add_request_use_case.dart';
import 'package:get/get.dart';

class CartAddRequestController extends GetxController {
  final CartAddRequestUseCase cartAddRequestUseCase;

  CartAddRequestController({required this.cartAddRequestUseCase});

  String _errorMessage = "";
  bool _loading = false;
  String get errorMessage => _errorMessage;
  bool get loading => _loading;

  Future<bool> addToCart({required CartAddRequestModel requestBody}) async {
    _errorMessage = "";
    _loading = true;
    update();
    final result = await cartAddRequestUseCase.execute(requestBody);
    final res = result.fold((l) {
      _errorMessage = l.message;
      return false;
    }, (r) => true);
    _loading = false;

    update();
    return res;
  }
}
