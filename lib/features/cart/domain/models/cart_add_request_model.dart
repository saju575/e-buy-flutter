class CartAddRequestModel {
  final String productId;
  final int quantity;
  final String? color;
  final String? size;

  CartAddRequestModel({
    required this.productId,
    required this.quantity,
    this.color,
    this.size,
  });
}
