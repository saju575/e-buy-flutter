import 'package:e_buy/features/product/domain/models/product_model.dart';

class ProductDto {
  final String id;
  final String? title;
  final String? description;
  // final String imageUrl;
  final double? regularPrice;
  final double? currentPrice;
  final String createdAt;
  final String updatedAt;
  // final List<ProductSizeModel> sizes;

  ProductDto({
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

  factory ProductDto.fromJson(Map<String, dynamic> jsonData) {
    return ProductDto(
      id: jsonData['_id'],
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? "",
      // imageUrl: json['imageUrl'],
      regularPrice: jsonData['regularPrice'],
      currentPrice: jsonData['currentPrice'],
      createdAt: jsonData['createdAt'],
      updatedAt: jsonData['updatedAt'],
      // sizes: json['sizes'],
    );
  }

  ProductModel toDomain() {
    return ProductModel(
      id: id,
      title: title,
      description: description,
      // imageUrl: imageUrl,
      regularPrice: regularPrice,
      currentPrice: currentPrice,
      createdAt: createdAt,
      updatedAt: updatedAt,
      // sizes: sizes,
    );
  }
}
