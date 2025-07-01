import 'package:e_buy/features/auth/domain/use_cases/login_use_case.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  LoginController({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase;
  bool loading = false;
  String errorMessage = '';

  Future<bool> login(String email, String password) async {
    loading = true;
    errorMessage = '';
    late bool isSuccess = false;
    update();
    try {
      await _loginUseCase.login(email, password);
      isSuccess = true;
    } catch (e) {
      errorMessage = e.toString();
      isSuccess = false;
    }
    loading = false;
    update();
    return isSuccess;
  }

  void logout() => _loginUseCase.logout();
}
