import 'package:e_buy/app/models/pagination.dart';

class PaginationDto<T> {
  final List<T> list;
  final bool? next;
  final int total;

  PaginationDto({required this.list, this.next, required this.total});

  factory PaginationDto.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return PaginationDto(
      list: List<Map<String, dynamic>>.from(
        json['results'],
      ).map(fromJson).toList(),
      next: json['next'],
      total: json['total'],
    );
  }

  Pagination<R> toDomain<R>({
    int currentPage = 1,
    required R Function(T) mapper,
  }) => Pagination<R>(
    list: list.map(mapper).toList(),
    next: next,
    total: total,
    currentPage: currentPage,
  );
}
