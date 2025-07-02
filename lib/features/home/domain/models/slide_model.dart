import 'package:equatable/equatable.dart';

class SlideModel extends Equatable {
  final String id;
  final String photo;
  final String description;
  final String? product;
  final String? brand;
  final String? category;
  final String createdAt;
  final String updatedAt;

  const SlideModel({
    required this.id,
    required this.photo,
    required this.description,
    this.product,
    this.brand,
    this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    photo,
    description,
    product,
    brand,
    category,
    createdAt,
    updatedAt,
  ];
}
