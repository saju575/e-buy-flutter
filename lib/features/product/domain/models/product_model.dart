import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String? title;
  final String? description;
  final String? metaDescription;
  final String? slug;
  final double? regularPrice;
  final double? currentPrice;
  final String createdAt;
  final String updatedAt;
  final int quantity;
  // final BrandModel? brand;
  final List<String>? photos;
  final List<String>? colors;
  final List<String>? sizes;
  final List<String>? tags;
  // final List<CategoryModel>? categories;

  const ProductModel({
    required this.id,
    this.title,
    this.description,
    this.regularPrice,
    this.currentPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.quantity,
    // this.brand,
    this.metaDescription,
    this.slug,
    this.photos,
    this.colors,
    this.sizes,
    this.tags,
    // this.categories,
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
    quantity,
    // brand,
    metaDescription,
    slug,
    photos,
    colors,
    sizes,
    tags,
    // categories,
  ];
}
