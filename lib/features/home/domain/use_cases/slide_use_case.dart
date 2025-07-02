import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/failure.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/home/domain/models/slide_model.dart';
import 'package:e_buy/features/home/domain/repositories/slide_repository.dart';

class SlideUseCase {
  final SlideRepository _slideRepository;
  SlideUseCase({required SlideRepository slideRepository})
    : _slideRepository = slideRepository;

  Future<Either<Failure, Pagination<SlideModel>>> getSlides({
    int page = 1,
    int limit = 10,
  }) => _slideRepository.getSlides(page: page, limit: limit);
}
