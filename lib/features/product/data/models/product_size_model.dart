class ProductSizeModel {
  final int id;
  final String size;

  ProductSizeModel({required this.id, required this.size});

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) =>
      ProductSizeModel(id: json["id"], size: json["size"]);

  Map<String, dynamic> toJson() => {"id": id, "size": size};

  ProductSizeModel copyWith({int? id, String? size}) =>
      ProductSizeModel(id: id ?? this.id, size: size ?? this.size);
}
