import 'package:e_buy/features/auth/domain/use_case/login_use_case.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  LoginController({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase;
  bool _loading = false;
  String errorMessage = '';

  bool get loading => _loading;

  Future<bool> login(String email, String password) async {
    _loading = true;
    errorMessage = '';
    late bool isSuccess = false;
    update();
    final response = await _loginUseCase.login(email, password);
    response.fold(
      (leftValue) {
        errorMessage = leftValue.message;
        isSuccess = false;
      },
      (rightValue) {
        errorMessage = '';
        isSuccess = true;
      },
    );
    _loading = false;
    update();
    return isSuccess;
  }

  void logout() => _loginUseCase.logout();
}
