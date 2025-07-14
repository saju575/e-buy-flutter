import 'package:e_buy/features/product/domain/models/product_model.dart';

class ProductDto {
  final String id;
  final String? title;
  final String? description;
  final String? metaDescription;
  final String? slug;
  final num? regularPrice;
  final num? currentPrice;
  final String createdAt;
  final String updatedAt;
  final int quantity;
  // final BrandDto? brand;
  final List<String>? photos;
  final List<String>? colors;
  final List<String>? sizes;
  final List<String>? tags;
  // final List<CategoryDto>? categories;

  ProductDto({
    required this.id,
    this.title,
    this.description,
    this.regularPrice,
    this.currentPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.quantity,
    this.metaDescription,
    this.slug,
    // this.brand,
    this.photos,
    this.colors,
    this.sizes,
    this.tags,
    // this.categories,
  });

  factory ProductDto.fromJson(Map<String, dynamic> jsonData) {
    return ProductDto(
      id: jsonData['_id'],
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? "",
      regularPrice: jsonData['regular_price'],
      currentPrice: jsonData['current_price'],
      createdAt: jsonData['createdAt'],
      updatedAt: jsonData['updatedAt'],
      quantity: jsonData['quantity'] ?? 0,
      slug: jsonData['slug'],
      metaDescription: jsonData['meta_description'],
      // brand: jsonData['brand'] != null
      //     ? BrandDto.fromJson(jsonData['brand'])
      //     : null,
      // categories: (jsonData['categories'] as List?)
      //     ?.map((e) => CategoryDto.fromJson(e))
      //     .toList(),
      photos: (jsonData['photos'] as List?)?.map((e) => e.toString()).toList(),
      colors: (jsonData['colors'] as List?)?.map((e) => e.toString()).toList(),
      sizes: (jsonData['sizes'] as List?)?.map((e) => e.toString()).toList(),
      tags: (jsonData['tags'] as List?)?.map((e) => e.toString()).toList(),
    );
  }

  ProductModel toDomain() {
    return ProductModel(
      id: id,
      title: title,
      description: description,
      regularPrice: regularPrice?.toDouble(),
      currentPrice: currentPrice?.toDouble(),
      createdAt: createdAt,
      updatedAt: updatedAt,
      quantity: quantity,
      metaDescription: metaDescription,
      slug: slug,
      photos: photos,
      colors: colors,
      sizes: sizes,
      tags: tags,
      // brand: brand?.toDomain(),
      // categories: categories?.map((e) => e.toDomain()).toList(),
    );
  }
}
