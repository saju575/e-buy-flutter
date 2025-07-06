import 'package:e_buy/core/services/local_storage/shared_pref_service.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/auth/data/data_source/auth_data_source.dart';
import 'package:e_buy/features/auth/data/data_source/login_data_source.dart';
import 'package:e_buy/features/auth/data/repositories/auth_repository_iml.dart';
import 'package:e_buy/features/auth/data/repositories/login_repository_iml.dart';
import 'package:e_buy/features/auth/domain/repositories/auth_repository.dart';
import 'package:e_buy/features/auth/domain/repositories/login_repository.dart';
import 'package:e_buy/features/auth/domain/use_case/auth_use_case.dart';
import 'package:e_buy/features/auth/domain/use_case/login_use_case.dart';
import 'package:e_buy/features/auth/ui/controllers/auth_controller.dart';
import 'package:e_buy/features/auth/ui/controllers/login_controller.dart';
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
  }
}
