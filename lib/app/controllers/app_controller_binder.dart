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
import 'package:e_buy/features/product/data/data_source/product_list_remote_data_source.dart';
import 'package:e_buy/features/product/data/repositories/category_repository_iml.dart';
import 'package:e_buy/features/product/data/repositories/product_list_repository_iml.dart';
import 'package:e_buy/features/product/domain/repositories/category_repository.dart';
import 'package:e_buy/features/product/domain/repositories/product_list_repository.dart';
import 'package:e_buy/features/product/domain/use_case/category_use_case.dart';
import 'package:e_buy/features/product/domain/use_case/product_list_use_case.dart';
import 'package:e_buy/features/product/ui/controllers/category_controller.dart';
import 'package:e_buy/features/product/ui/controllers/product_list_controller.dart';
import 'package:e_buy/features/settings/data/datasources/theme_local_datasources.dart';
import 'package:e_buy/features/settings/data/repositories/theme_repository_impl.dart';
import 'package:e_buy/features/settings/domain/repositories/theme_repository.dart';
import 'package:e_buy/features/settings/domain/use_cases/theme_use_case.dart';
import 'package:e_buy/features/settings/ui/controllers/theme_controller.dart';
import 'package:e_buy/features/shared/ui/controllers/main_bottom_nav_controller.dart';
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
    Get.put<MainBottomNavController>(MainBottomNavController());
    Get.put<NetworkClientService>(NetworkClientService());

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

    // Auth dependencies
    Get.lazyPut(
      () => AuthDataSource(
        networkClientService: Get.find(),
        sharedPrefService: sharedPreferService,
        tokenKey: tokenKey,
        userKey: userKey,
      ),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryIml(authDataSource: Get.find()),
    );
    Get.lazyPut(() => AuthUseCase(authRepository: Get.find()));
    Get.lazyPut(() => AuthController(authUseCase: Get.find()));

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

    //category dependencies
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

    //home controller
    Get.lazyPut(
      () => HomeController(
        slideController: Get.find(),
        categoryController: Get.find(),
        newProductListController: Get.find(),
        popularProductListController: Get.find(),
        specialProductListController: Get.find(),
      ),
    );
  }
}
