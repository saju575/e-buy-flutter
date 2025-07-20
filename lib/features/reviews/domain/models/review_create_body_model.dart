class ReviewCreateBodyModel {
  final String comment;
  final int? rating;
  final String productId;

  ReviewCreateBodyModel({
    required this.comment,
    this.rating,
    required this.productId,
  });
}
