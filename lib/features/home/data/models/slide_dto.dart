import 'package:e_buy/features/home/domain/models/slide_model.dart';

class SlideDto {
  final String id;
  final String photo;
  final String description;
  final String? product;
  final String? brand;
  final String? category;
  final String createdAt;
  final String updatedAt;

  SlideDto({
    required this.id,
    required this.photo,
    required this.description,
    this.product,
    this.brand,
    this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SlideDto.fromJson(Map<String, dynamic> jsonData) => SlideDto(
    id: jsonData["_id"],
    photo: jsonData["photo_url"] ?? "",
    description: jsonData["description"] ?? "",
    product: jsonData["product"],
    brand: jsonData["brand"],
    category: jsonData["category"],
    createdAt: jsonData["created_at"] ?? "",
    updatedAt: jsonData["updated_at"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "photo_url": photo,
    "description": description,
    "product": product,
    "brand": brand,
    "category": category,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

  SlideModel toDomain() => SlideModel(
    id: id,
    photo: photo,
    description: description,
    product: product,
    brand: brand,
    category: category,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );
}
