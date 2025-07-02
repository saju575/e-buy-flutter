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
    final response = _authUseCase.getUserProfile();
    return response.fold((leftValue) => null, (rightValue) => rightValue);
  }

  String get getToken {
    return _authUseCase.getToken();
  }
}
