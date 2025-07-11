import 'package:e_buy/features/product/domain/models/brand_model.dart';

class BrandDto {
  final String id;
  final String title;
  final String slug;
  final String icon;

  BrandDto({
    required this.id,
    required this.title,
    required this.slug,
    required this.icon,
  });

  factory BrandDto.fromJson(Map<String, dynamic> json) {
    return BrandDto(
      id: json['_id'],
      title: json['title'],
      slug: json['slug'],
      icon: json['icon'],
    );
  }

  BrandModel toDomain() {
    return BrandModel(id: id, title: title, slug: slug, icon: icon);
  }
}
