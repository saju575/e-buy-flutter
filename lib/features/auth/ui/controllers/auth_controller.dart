import 'package:e_buy/features/auth/domain/models/user.dart';
import 'package:e_buy/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthUseCase _authUseCase;

  AuthController({required AuthUseCase authUseCase})
    : _authUseCase = authUseCase;

  bool get isLoggedIn {
    return _authUseCase.isUserLoggedIn;
  }

  User? get getUserProfile {
    return _authUseCase.getUserProfile();
  }

  String get getToken {
    return _authUseCase.getToken();
  }
}
