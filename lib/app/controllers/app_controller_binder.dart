import 'package:e_buy/core/services/local_storage/shared_pref_service.dart';
import 'package:e_buy/core/services/network/network_client_service.dart';
import 'package:e_buy/features/settings/data/datasources/theme_local_datasources.dart';
import 'package:e_buy/features/settings/data/repositories/theme_repository_impl.dart';
import 'package:e_buy/features/settings/domain/repositories/theme_repository.dart';
import 'package:e_buy/features/settings/domain/use_cases/theme_use_case.dart';
import 'package:e_buy/features/settings/ui/controllers/theme_controller.dart';
import 'package:e_buy/features/shared/ui/controllers/main_bottom_nav_controller.dart';
import 'package:get/get.dart';

class AppControllerBinder extends Bindings {
  final sharedPreferService = SharedPrefService();
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
  }
}
