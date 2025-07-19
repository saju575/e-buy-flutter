import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/core/services/local_storage/shared_pref_service.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/auth/data/data_source/auth_data_source.dart';
import 'package:e_buy/features/auth/data/data_source/login_data_source.dart';
import 'package:e_buy/features/auth/data/data_source/register_data_source.dart';
import 'package:e_buy/features/auth/data/data_source/register_otp_verify_data_source.dart';
import 'package:e_buy/features/auth/data/repositories/auth_repository_iml.dart';
import 'package:e_buy/features/auth/data/repositories/login_repository_iml.dart';
import 'package:e_buy/features/auth/data/repositories/register_otp_verify_repository_iml.dart';
import 'package:e_buy/features/auth/data/repositories/register_repository_iml.dart';
import 'package:e_buy/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_buy/features/auth/domain/repositories/login_repository.dart';
import 'package:e_buy/features/auth/domain/repositories/register_otp_verify_repository.dart';
import 'package:e_buy/features/auth/domain/repositories/register_repository.dart';
import 'package:e_buy/features/auth/domain/use_case/auth_use_case.dart';
import 'package:e_buy/features/auth/domain/use_case/login_use_case.dart';
import 'package:e_buy/features/auth/domain/use_case/register_otp_verify_use_case.dart';
import 'package:e_buy/features/auth/domain/use_case/register_resend_otp_use_case.dart';
import 'package:e_buy/features/auth/domain/use_case/register_use_case.dart';
import 'package:e_buy/features/auth/ui/controllers/auth_controller.dart';
import 'package:e_buy/features/auth/ui/controllers/login_controller.dart';
import 'package:e_buy/features/auth/ui/controllers/register_controller.dart';
import 'package:e_buy/features/auth/ui/controllers/register_otp_verify_controller.dart';
import 'package:e_buy/features/auth/ui/controllers/register_resend_otp_controller.dart';
import 'package:e_buy/features/cart/data/data_source/cart_items_remote_data_source.dart';
import 'package:e_buy/features/cart/data/repositories/cart_repository_iml.dart';
import 'package:e_buy/features/cart/domain/repositories/cart_repository.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_add_request_use_case.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_item_remove_use_case.dart';
import 'package:e_buy/features/cart/domain/use_case/cart_items_use_case.dart';
import 'package:e_buy/features/cart/ui/controllers/cart_controller.dart';
import 'package:e_buy/features/home/data/data_source/slide_remote_data_source.dart';
import 'package:e_buy/features/home/data/repositories/slide_repository_iml.dart';
import 'package:e_buy/features/home/domain/repositories/slide_repository.dart';
import 'package:e_buy/features/home/domain/use_case/slide_use_case.dart';
import 'package:e_buy/features/home/ui/controllers/home_controller.dart';
import 'package:e_buy/features/home/ui/controllers/new_product_list_controller.dart';
import 'package:e_buy/features/home/ui/controllers/popular_product_list_controller.dart';
import 'package:e_buy/features/home/ui/controllers/slide_controller.dart';
import 'package:e_buy/features/home/ui/controllers/special_product_list_controller.dart';
import 'package:e_buy/features/product/data/data_source/category_remote_data_source.dart';
import 'package:e_buy/features/product/data/data_source/product_details_remote_data_source.dart';
import 'package:e_buy/features/product/data/data_source/product_list_remote_data_source.dart';
import 'package:e_buy/features/product/data/repositories/category_repository_iml.dart';
import 'package:e_buy/features/product/data/repositories/product_details_repository_iml.dart';
import 'package:e_buy/features/product/data/repositories/product_list_repository_iml.dart';
import 'package:e_buy/features/product/domain/repositories/category_repository.dart';
import 'package:e_buy/features/product/domain/repositories/product_details_repository.dart';
import 'package:e_buy/features/product/domain/repositories/product_list_repository.dart';
import 'package:e_buy/features/product/domain/use_case/category_use_case.dart';
import 'package:e_buy/features/product/domain/use_case/product_details_use_case.dart';
import 'package:e_buy/features/product/domain/use_case/product_list_use_case.dart';
import 'package:e_buy/features/product/ui/controllers/category_controller.dart';
import 'package:e_buy/features/product/ui/controllers/product_details_controller.dart';
import 'package:e_buy/features/product/ui/controllers/product_list_controller.dart';
import 'package:e_buy/features/reviews/data/data-source/review_remote_data_source.dart';
import 'package:e_buy/features/reviews/data/repositories/review_repository_iml.dart';
import 'package:e_buy/features/reviews/domain/repositories/review_repository.dart';
import 'package:e_buy/features/reviews/domain/use_case/review_list_use_case.dart';
import 'package:e_buy/features/reviews/ui/controllers/review_controller.dart';
import 'package:e_buy/features/settings/data/datasources/theme_local_datasources.dart';
import 'package:e_buy/features/settings/data/repositories/theme_repository_impl.dart';
import 'package:e_buy/features/settings/domain/repositories/theme_repository.dart';
import 'package:e_buy/features/settings/domain/use_cases/theme_use_case.dart';
import 'package:e_buy/features/settings/ui/controllers/theme_controller.dart';
import 'package:e_buy/features/shared/ui/controllers/main_bottom_nav_controller.dart';
import 'package:e_buy/features/wish_list/data/data_source/wish_list_remote_data_source.dart';
import 'package:e_buy/features/wish_list/data/repositories/wish_list_repository_iml.dart';
import 'package:e_buy/features/wish_list/domain/repositories/wish_list_repository.dart';
import 'package:e_buy/features/wish_list/domain/use_case/wish_list_use_case.dart';
import 'package:e_buy/features/wish_list/domain/use_case/wishlist_create_use_case.dart';
import 'package:e_buy/features/wish_list/domain/use_case/wishlist_remove_use_case.dart';
import 'package:e_buy/features/wish_list/ui/controllers/wish_list_controller.dart';
import 'package:get/get.dart';

class AppControllerBinder extends Bindings {
  final sharedPreferService = SharedPrefService();
  final String tokenKey = "token";
  final String userKey = "user";
  @override
  void dependencies() async {
    Get.put<ThemeLocalDatasources>(
      ThemeLocalDatasources(sharedPreferService: sharedPreferService),
    );
    Get.put<NetworkClientService>(
      NetworkClientService(getHeaders: headers, onUnauthorized: onUnauthorized),
    );

    // Auth dependencies
    Get.put<AuthDataSource>(
      AuthDataSource(
        networkClientService: Get.find(),
        sharedPrefService: sharedPreferService,
        tokenKey: tokenKey,
        userKey: userKey,
      ),
    );
    Get.put<AuthRepository>(AuthRepositoryIml(authDataSource: Get.find()));
    Get.put<AuthUseCase>(AuthUseCase(authRepository: Get.find()));
    Get.put<AuthController>(AuthController(authUseCase: Get.find()));

    Get.put<MainBottomNavController>(
      MainBottomNavController(authController: Get.find()),
    );

    Get.put<ThemeRepository>(
      ThemeRepositoryImpl(themeLocalDatasources: Get.find()),
    );
    Get.put<ThemeUseCase>(ThemeUseCase(themeRepository: Get.find()));
    Get.put<ThemeController>(ThemeController(themeUseCase: Get.find()));

    // Slide dependencies
    Get.lazyPut(() => SlideRemoteDataSource(networkClientService: Get.find()));
    Get.lazyPut<SlideRepository>(
      () => SlideRepositoryIml(slideRemoteDataSource: Get.find()),
    );
    Get.lazyPut(() => SlideUseCase(slideRepository: Get.find()));
    Get.lazyPut(() => SlideController(slideUseCase: Get.find()));

    // Login dependencies
    Get.lazyPut(
      () => LoginDataSource(
        networkClientService: Get.find(),
        sharedPrefService: sharedPreferService,
        tokenKey: tokenKey,
        userKey: userKey,
      ),
    );
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryIml(loginDatasource: Get.find()),
    );
    Get.lazyPut(() => LoginUseCase(loginRepository: Get.find()));
    Get.lazyPut(() => LoginController(loginUseCase: Get.find()));

    // register dependencies
    Get.lazyPut(() => RegisterDataSource(networkClientService: Get.find()));
    Get.lazyPut<RegisterRepository>(
      () => RegisterRepositoryIml(registerDataSource: Get.find()),
    );
    Get.lazyPut(() => RegisterUseCase(registerRepository: Get.find()));
    Get.lazyPut(() => RegisterController(registerUseCase: Get.find()));

    // register otp dependencies
    Get.lazyPut(
      () => RegisterOtpVerifyDataSource(networkClientService: Get.find()),
    );
    Get.lazyPut<RegisterOtpVerifyRepository>(
      () => RegisterOtpVerifyRepositoryIml(
        registerOtpVerifyDataSource: Get.find(),
      ),
    );
    Get.lazyPut(
      () => RegisterOtpVerifyUseCase(registerOtpVerifyRepository: Get.find()),
    );
    Get.lazyPut(
      () => RegisterResendOtpUseCase(registerOtpVerifyRepository: Get.find()),
    );
    Get.lazyPut(
      () => RegisterResendOtpController(registerOtpVerifyUseCase: Get.find()),
    );
    Get.lazyPut(
      () => RegisterOtpVerifyController(registerOtpVerifyUseCase: Get.find()),
    );

    //category dependencies
    Get.lazyPut(
      () => CategoryRemoteDataSource(networkClientService: Get.find()),
    );
    Get.lazyPut<CategoryRepository>(
      () => CategoryRepositoryIml(categoryRemoteDataSource: Get.find()),
    );
    Get.lazyPut(() => CategoryUseCase(categoryRepository: Get.find()));
    Get.lazyPut(() => CategoryController(categoryUseCase: Get.find()));

    //product list dependencies
    Get.lazyPut(
      () => ProductListRemoteDateSource(networkClientService: Get.find()),
    );
    Get.lazyPut<ProductListRepository>(
      () => ProductListRepositoryIml(productListRemoteDateSource: Get.find()),
    );
    Get.lazyPut(() => ProductListUseCase(productListRepository: Get.find()));
    Get.lazyPut(() => NewProductListController(productListUseCase: Get.find()));
    Get.lazyPut(
      () => PopularProductListController(productListUseCase: Get.find()),
    );
    Get.lazyPut(
      () => SpecialProductListController(productListUseCase: Get.find()),
    );
    Get.lazyPut(() => ProductListController(productListUseCase: Get.find()));

    // cart dependencies
    Get.lazyPut(
      () => CartItemsRemoteDataSource(networkClientService: Get.find()),
    );
    Get.lazyPut<CartRepository>(
      () => CartRepositoryIml(cartItemsRemoteDataSource: Get.find()),
    );
    Get.lazyPut(() => CartItemsUseCase(cartRepository: Get.find()));
    Get.lazyPut(() => CartAddRequestUseCase(cartRepository: Get.find()));
    Get.lazyPut(() => CartItemRemoveUseCase(cartRepository: Get.find()));
    Get.lazyPut(
      () => CartController(
        cartItemsUseCase: Get.find(),
        cartAddRequestUseCase: Get.find(),
        cartItemRemoveUseCase: Get.find(),
      ),
    );

    // product details dependencies
    Get.lazyPut(
      () => ProductDetailsRemoteDataSource(networkClientService: Get.find()),
    );
    Get.lazyPut<ProductDetailsRepository>(
      () => ProductDetailsRepositoryIml(
        productDetailsRemoteDataSource: Get.find(),
      ),
    );
    Get.lazyPut(
      () => ProductDetailsUseCase(productDetailsRepository: Get.find()),
    );
    Get.lazyPut(
      () => ProductDetailsController(productDetailsUseCase: Get.find()),
    );

    //wish list dependencies
    Get.lazyPut(
      () => WishListRemoteDataSource(networkClientService: Get.find()),
    );
    Get.lazyPut<WishListRepository>(
      () => WishListRepositoryIml(wishListRemoteDataSource: Get.find()),
    );
    Get.lazyPut(() => WishListUseCase(wishListRepository: Get.find()));
    Get.lazyPut(() => WishlistRemoveUseCase(wishListRepository: Get.find()));
    Get.lazyPut(() => WishlistCreateUseCase(wishlistRepository: Get.find()));
    Get.lazyPut(
      () => WishListController(
        wishListUseCase: Get.find(),
        wishlistRemoveUseCase: Get.find(),
        wishListCreateUseCase: Get.find(),
      ),
    );

    //review dependencies
    Get.lazyPut(() => ReviewRemoteDataSource(networkClientService: Get.find()));
    Get.lazyPut<ReviewRepository>(
      () => ReviewRepositoryIml(reviewRemoteDataSource: Get.find()),
    );
    Get.lazyPut(() => ReviewListUseCase(repository: Get.find()));
    Get.lazyPut(() => ReviewController(reviewListUseCase: Get.find()));

    //home controller
    Get.put<HomeController>(
      HomeController(
        slideController: Get.find(),
        categoryController: Get.find(),
        newProductListController: Get.find(),
        popularProductListController: Get.find(),
        specialProductListController: Get.find(),
      ),
    );
  }

  Map<String, String> headers() {
    return {'token': sharedPreferService.getString(tokenKey) ?? ''};
  }

  void onUnauthorized() {
    sharedPreferService.clear();
    if (Get.currentRoute != AppRoutes.login) {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
