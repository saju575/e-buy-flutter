import 'package:e_buy/features/product/data/models/brand_dto.dart';
import 'package:e_buy/features/product/data/models/category_dto.dart';
import 'package:e_buy/features/product/domain/models/product_model.dart';

class ProductDto {
  final String id;
  final String? title;
  // BrandDto? brand;
  // List<CategoryDto>? categories;
  // String? slug;
  // String? metaDescription;
  // String? description;
  // List<String>? photos;
  // List<String>? colors;
  // List<String>? sizes;
  // List<String>? tags;
  // double? regularPrice;
  // double? currentPrice;
  final int quantity;
  final String createdAt;
  final String updatedAt;

  ProductDto({
    required this.id,
    this.title,
    // this.brand,
    // this.categories,
    // this.slug,
    // this.metaDescription,
    // this.description,
    // this.photos,
    // this.colors,
    // this.sizes,
    // this.tags,
    // this.regularPrice,
    // this.currentPrice,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    print("ProductDto $json");
    return ProductDto(
      id: json['_id'],
      title: json['title'],
      // brand: json['brand'] != null ? BrandDto.fromJson(json['brand']) : null,
      // categories: json['categories'] != null
      //     ? List<CategoryDto>.from(
      //         json['categories'].map(
      //           (category) => CategoryDto.fromJson(category),
      //         ),
      //       )
      //     : null,
      // slug: json['slug'],
      // metaDescription: json['meta_description'],
      // description: json['description'],
      // photos: json['photos'] != null
      //     ? List<String>.from(json['photos'].map((photo) => photo))
      //     : null,
      // colors: json['colors'] != null
      //     ? List<String>.from(json['colors'].map((color) => color))
      //     : null,
      // sizes: json['sizes'] != null
      //     ? List<String>.from(json['sizes'].map((size) => size))
      //     : null,

      // tags: json['tags'] != null
      //     ? List<String>.from(json['tags'].map((tag) => tag))
      //     : null,
      // regularPrice: json['regular_price'],
      // currentPrice: json['current_price'],
      quantity: json['quantity'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  ProductModel toDomain() {
    return ProductModel(
      id: id,
      title: title,
      // brand: brand?.toDomain(),
      // categories: categories?.map((category) => category.toDomain()).toList(),
      // slug: slug,
      // metaDescription: metaDescription,
      // description: description,
      // photos: photos,
      // colors: colors,
      // sizes: sizes,
      // tags: tags,
      // regularPrice: regularPrice,
      // currentPrice: currentPrice,
      quantity: quantity,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
