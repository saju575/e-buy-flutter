import 'package:e_buy/features/home/domain/models/slide_model.dart';
import 'package:e_buy/features/home/domain/use_case/slide_use_case.dart';
import 'package:get/get.dart';

class SlideController extends GetxController {
  final SlideUseCase _slideUseCase;
  SlideController({required SlideUseCase slideUseCase})
    : _slideUseCase = slideUseCase;

  bool _loading = false;
  String? _errorMessage;
  List<SlideModel> _slides = [];

  bool get loading => _loading;
  String? get errorMessage => _errorMessage;
  List<SlideModel> get slides => _slides;

  Future<bool> getHomeSlides() async {
    late bool isSuccess = false;
    _loading = true;
    _errorMessage = null;

    update();
    final result = await _slideUseCase.execute();

    result.fold(
      (l) {
        _errorMessage = l.message;
        isSuccess = false;
        _loading = false;
      },
      (r) {
        _errorMessage = null;
        _slides = r.list;
        isSuccess = true;
        _loading = false;
      },
    );
    update();
    return isSuccess;
  }
}
