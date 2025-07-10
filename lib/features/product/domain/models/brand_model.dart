class BrandModel {
  String id;
  String title;
  String slug;
  String icon;

  BrandModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.icon,
  });

  BrandModel copyWith({String? id, String? title, String? slug, String? icon}) {
    return BrandModel(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      icon: icon ?? this.icon,
    );
  }
}
