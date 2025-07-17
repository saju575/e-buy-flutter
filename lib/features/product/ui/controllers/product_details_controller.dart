import 'package:e_buy/features/product/domain/models/product_model.dart';
import 'package:e_buy/features/product/domain/models/product_params_model.dart';
import 'package:e_buy/features/product/domain/use_case/product_details_use_case.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  final ProductDetailsUseCase _productDetailsUseCase;
  ProductDetailsController({
    required ProductDetailsUseCase productDetailsUseCase,
  }) : _productDetailsUseCase = productDetailsUseCase;
  bool _loading = false;
  bool _refreshing = false;
  String? _errorMessage;
  ProductModel? _productDetails;
  // String? _selectedSize;

  bool get loading => _loading;
  bool get refreshing => _refreshing;
  String? get errorMessage => _errorMessage;
  ProductModel? get productDetails => _productDetails;
  // String? get selectedSize => _selectedSize;

  // set selectedSize(String? value) {
  //   _selectedSize = value;
  //   update();
  // }

  Future<void> getProductDetails(String id) async {
    if (_loading) return;
    if (!_refreshing) {
      _loading = true;
    }
    _errorMessage = null;
    update();
    final response = await _productDetailsUseCase.execute(
      ProductParamsModel(productId: id),
    );
    response.fold(
      (left) {
        _loading = false;
        _errorMessage = left.message;
      },
      (right) {
        _loading = false;
        _productDetails = right;
      },
    );

    update();
  }

  Future<void> refreshData() async {
    if (_refreshing) return;
    _refreshing = true;
    update();
    await getProductDetails(_productDetails!.id);
    _refreshing = false;
    update();
  }
}
