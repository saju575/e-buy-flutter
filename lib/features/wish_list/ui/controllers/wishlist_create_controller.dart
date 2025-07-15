import 'package:e_buy/features/wish_list/domain/models/wishlist_create_model.dart';
import 'package:e_buy/features/wish_list/domain/use_case/wishlist_create_use_case.dart';
import 'package:get/get.dart';

class WishlistCreateController extends GetxController {
  final WishlistCreateUseCase wishListCreateUseCase;

  WishlistCreateController({required this.wishListCreateUseCase});
  String _errorMessage = "";
  String get errorMessage => _errorMessage;
  Future<bool> addToWishlist({required String productId}) async {
    _errorMessage = "";
    final result = await wishListCreateUseCase.execute(
      body: WishListCreateBodyModel(productId: productId),
    );
    return result.fold((l) {
      _errorMessage = l.message;
      return false;
    }, (r) => true);
  }
}
