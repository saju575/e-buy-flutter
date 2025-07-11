import 'package:e_buy/features/product/domain/models/brand_model.dart';
import 'package:e_buy/features/product/domain/models/category_model.dart';

class ProductModel {
  String id;
  String? title;
  // BrandModel? brand;
  // List<CategoryModel>? categories;
  // String? slug;
  // String? metaDescription;
  // String? description;
  // List<String>? photos;
  // List<String>? colors;
  // List<String>? sizes;
  // List<String>? tags;
  // double? regularPrice;
  // double? currentPrice;
  int quantity;
  String createdAt;
  String updatedAt;

  ProductModel({
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

  ProductModel copyWith({
    String? id,
    String? title,
    // BrandModel? brand,
    // List<CategoryModel>? categories,
    // String? slug,
    // String? metaDescription,
    // String? description,
    // List<String>? photos,
    // List<String>? colors,
    // List<String>? sizes,
    // List<String>? tags,
    // double? regularPrice,
    // double? currentPrice,
    int? quantity,
    String? createdAt,
    String? updatedAt,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      // brand: brand ?? this.brand,
      // categories: categories ?? this.categories,
      // slug: slug ?? this.slug,
      // metaDescription: metaDescription ?? this.metaDescription,
      // description: description ?? this.description,
      // photos: photos ?? this.photos,
      // colors: colors ?? this.colors,
      // sizes: sizes ?? this.sizes,
      // tags: tags ?? this.tags,
      // regularPrice: regularPrice ?? this.regularPrice,
      // currentPrice: currentPrice ?? this.currentPrice,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
