import 'package:e_buy/app/models/base_query.dart';
import 'package:e_buy/app/models/either.dart';
import 'package:e_buy/app/models/pagination.dart';
import 'package:get/get.dart';

abstract class BasePaginationController<
  ListModel,
  QueryModel extends BaseQuery<QueryModel>
>
    extends GetxController {
  List<ListModel> list = [];

  int _currentPage = 1;
  bool _hasNextPage = true;
  bool _isInitialLoading = false;
  bool _loading = true;
  bool _isLoadingMore = false;
  bool _isRefreshing = false;

  late QueryModel _query;

  // List<ListModel> get list => _list;
  int get currentPage => _currentPage;
  bool get hasNextPage => _hasNextPage;
  bool get initialLoading => _isInitialLoading;
  bool get loadingMore => _isLoadingMore;
  bool get refreshing => _isRefreshing;
  bool get loading => _loading;
  QueryModel get query => _query;

  Future<Either<Failure, Pagination<ListModel>>> fetchPage(QueryModel query);

  /// Load first page
  Future<void> loadInitial({required QueryModel query}) async {
    if (_isInitialLoading) return;
    _isInitialLoading = true;
    _currentPage = 1;
    _query = query.copyWith(page: _currentPage);

    update();

    final response = await fetchPage(_query);
    response.fold(
      (left) {
        _isInitialLoading = false;
        // Need to handle error
      },
      (right) {
        _isInitialLoading = false;
        list.clear();
        list.addAll(right.list);
        _currentPage = right.currentPage;
        _hasNextPage = right.next ?? false;
      },
    );
    _loading = false;
    update();
  }

  /// Load more
  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasNextPage) return;
    _isLoadingMore = true;
    _currentPage += 1;

    final nextQuery = _query.copyWith(page: _currentPage);

    update();

    final response = await fetchPage(nextQuery);
    response.fold(
      (left) {
        _isLoadingMore = false;
        // Need to handle error
      },
      (right) {
        list.addAll(right.list);
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
    _currentPage = 1;

    final refreshQuery = _query.copyWith(page: _currentPage);

    update();
    final response = await fetchPage(refreshQuery);
    response.fold(
      (left) {
        _isRefreshing = false;
        // Need to handle error
      },
      (right) {
        list.clear();
        list.addAll(right.list);
        _isRefreshing = false;
        _currentPage = right.currentPage;
        _hasNextPage = right.next ?? false;
      },
    );
    update();
  }

  void _reset() {
    list.clear();
    _currentPage = 1;
    _hasNextPage = true;
    _isInitialLoading = false;
    _isLoadingMore = false;
    _isRefreshing = false;
  }

  Future<void> resetBasedOnQuery(QueryModel query) async {
    _reset();
    await loadInitial(query: query);
  }
}
