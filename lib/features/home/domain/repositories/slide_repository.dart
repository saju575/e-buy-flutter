import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/failure.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/home/domain/models/slide_model.dart';

abstract class SlideRepository {
  Future<Either<Failure, Pagination<SlideModel>>> getSlides({
    int page = 1,
    int limit = 10,
  });
}
