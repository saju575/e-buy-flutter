import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:get/get.dart';

abstract class BasePaginationController<ListModel> extends GetxController {
  final List<ListModel> _list = [];

  int _currentPage = 1;
  bool _hasNextPage = true;
  bool _isInitialLoading = false;
  bool _isLoadingMore = false;
  bool _isRefreshing = false;

  List<ListModel> get list => _list;
  int get currentPage => _currentPage;
  bool get hasNextPage => _hasNextPage;
  bool get initialLoading => _isInitialLoading;
  bool get loadingMore => _isLoadingMore;
  bool get refreshing => _isRefreshing;

  Future<Either<Failure, Pagination<ListModel>>> fetchPage(
    int page, {
    int limit = 20,
  });

  /// Load first page
  Future<void> loadInitial() async {
    if (_isInitialLoading) return;
    _isInitialLoading = true;
    update();
    final response = await fetchPage(1);
    response.fold(
      (left) {
        _isInitialLoading = false;
        // Need to handle error
      },
      (right) {
        _isInitialLoading = false;
        _list.clear();
        _list.addAll(right.list);
        _currentPage = right.currentPage;
        _hasNextPage = right.next ?? false;
      },
    );
    update();
  }

  /// Load more
  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasNextPage) return;
    _isLoadingMore = true;
    update();

    final response = await fetchPage(_currentPage + 1);
    response.fold(
      (left) {
        _isLoadingMore = false;
        // Need to handle error
      },
      (right) {
        _list.addAll(right.list);
        _isLoadingMore = false;
        _currentPage = right.currentPage;
        _hasNextPage = right.next ?? false;
      },
    );
    update();
  }

  /// Pull to refresh
  Future<void> refreshData() async {
    if (_isRefreshing) return;
    _isRefreshing = true;
    update();
    final response = await fetchPage(1);
    response.fold(
      (left) {
        _isRefreshing = false;
        // Need to handle error
      },
      (right) {
        _list.clear();
        _list.addAll(right.list);
        _isRefreshing = false;
        _currentPage = right.currentPage;
        _hasNextPage = right.next ?? false;
      },
    );
    update();
  }
}
