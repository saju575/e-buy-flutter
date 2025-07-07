class Pagination<T> {
  final List<T> list;
  final int currentPage;
  final bool? next;
  final int total;

  Pagination({
    required this.list,
    required this.currentPage,
    this.next,
    required this.total,
  });
}
