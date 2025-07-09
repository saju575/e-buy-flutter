class CategoryModel {
  final String id;
  final String title;
  final String iconUrl;
  final String? slug;

  CategoryModel({
    required this.id,
    required this.title,
    required this.iconUrl,
    this.slug,
  });

  CategoryModel copyWith({
    String? id,
    String? title,
    String? iconUrl,
    String? slug,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      iconUrl: iconUrl ?? this.iconUrl,
      slug: slug ?? this.slug,
    );
  }
}
