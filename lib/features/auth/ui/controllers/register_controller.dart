import 'package:e_buy/features/auth/domain/models/register_request_model.dart';
import 'package:e_buy/features/auth/domain/use_case/register_use_case.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final RegisterUseCase _registerUseCase;

  RegisterController({required RegisterUseCase registerUseCase})
    : _registerUseCase = registerUseCase;

  bool _loading = false;

  String? _errorMessage;
  late String _message;

  bool get loading => _loading;

  String? get errorMessage => _errorMessage;

  String get message => _message;

  Future<bool> register(RegisterRequestModel registerRequestModel) async {
    bool isSuccess = false;
    _loading = true;
    update();
    final response = await _registerUseCase.execute(registerRequestModel);
    response.fold(
      (leftValue) {
        _errorMessage = leftValue.message;
        isSuccess = false;
      },
      (rightValue) {
        _message = 'An OTP has been sent to your email address.';
        isSuccess = true;
      },
    );
    _loading = false;
    update();
    return isSuccess;
  }
}
