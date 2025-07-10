abstract class BaseQuery<T extends BaseQuery<T>> {
  final int page;
  final int count;

  BaseQuery({required this.page, required this.count});

  /// Enforce every subclass to implement copyWith
  T copyWith({int? page, int? count});
}
