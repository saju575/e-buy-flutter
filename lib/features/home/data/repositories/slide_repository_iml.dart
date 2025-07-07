import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:e_buy/features/home/data/data_source/slide_remote_data_source.dart';
import 'package:e_buy/features/home/domain/models/slide_model.dart';
import 'package:e_buy/features/home/domain/repositories/slide_repository.dart';

class SlideRepositoryIml implements SlideRepository {
  final SlideRemoteDataSource _slideRemoteDataSource;

  SlideRepositoryIml({required SlideRemoteDataSource slideRemoteDataSource})
    : _slideRemoteDataSource = slideRemoteDataSource;

  @override
  Future<Either<Failure, Pagination<SlideModel>>> getSlides({
    int page = 1,
    int limit = 10,
  }) async {
    final response = await _slideRemoteDataSource.getSlides(
      page: page,
      limit: limit,
    );
    return response.fold(
      (left) => Left(left),
      (right) => Right(
        right.toDomain(currentPage: page, mapper: (item) => item.toDomain()),
      ),
    );
  }
}
