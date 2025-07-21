import 'package:e_buy/features/auth/domain/models/user_model.dart';
import 'package:e_buy/features/auth/domain/use_case/auth_use_case.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthUseCase _authUseCase;

  AuthController({required AuthUseCase authUseCase})
    : _authUseCase = authUseCase;

  bool get isLoggedIn {
    return _authUseCase.isUserLoggedIn;
  }

  UserModel? get getUserProfile {
    final response = _authUseCase.getUserProfile();
    return response.fold((leftValue) => null, (rightValue) => rightValue);
  }

  String get getToken {
    return _authUseCase.getToken();
  }

  String getFullUserName() {
    final userModel = getUserProfile;
    return '${userModel?.firstName ?? ""} ${userModel?.lastName ?? ""}';
  }
}
