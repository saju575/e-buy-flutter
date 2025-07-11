import 'package:e_buy/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:e_buy/features/home/ui/controllers/slide_controller.dart';
import 'package:e_buy/features/product/ui/controllers/category_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final SlideController _slideController;
  final CategoryController _categoryController;
  final NewProductListController _newProductListController;

  HomeController({
    required SlideController slideController,
    required CategoryController categoryController,
    required NewProductListController newProductListController,
  }) : _slideController = slideController,
       _categoryController = categoryController,
       _newProductListController = newProductListController;

  bool _loading = false;
  bool _initialLoading = true;
  String? _errorMessage;

  bool get loading => _loading;
  bool get initialLoading => _initialLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAllData({bool silentRefresh = true}) async {
    if (!silentRefresh) {
      _initialLoading = true;
    }
    _loading = true;
    _errorMessage = null;
    update();
    try {
      await Future.wait([
        _slideController.getHomeSlides(),
        // _categoryController.loadInitialData(),
        _newProductListController.loadInitialData(),
      ]);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _initialLoading = false;
      _loading = false;
      update();
    }
  }
}
