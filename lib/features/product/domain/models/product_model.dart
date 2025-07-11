import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String? title;
  final String? description;
  // final String imageUrl;
  final double? regularPrice;
  final double? currentPrice;
  final String createdAt;
  final String updatedAt;
  // final List<ProductSizeModel> sizes;

  const ProductModel({
    required this.id,
    this.title,
    this.description,
    // required this.imageUrl,
    this.regularPrice,
    this.currentPrice,
    required this.createdAt,
    required this.updatedAt,
    // required this.sizes,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    regularPrice,
    currentPrice,
    createdAt,
    updatedAt,
  ];
}
