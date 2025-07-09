import 'package:e_buy/features/product/domain/models/category_model.dart';

class CategoryDto {
  final String id;
  final String title;
  final String iconUrl;
  final String? slug;

  CategoryDto({
    required this.id,
    required this.title,
    required this.iconUrl,
    this.slug,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> jsonData) {
    return CategoryDto(
      id: jsonData['_id'],
      title: jsonData['title'],
      iconUrl: jsonData['icon'],
      slug: jsonData['slug'],
    );
  }

  CategoryModel toDomain() {
    return CategoryModel(id: id, title: title, iconUrl: iconUrl, slug: slug);
  }
}
