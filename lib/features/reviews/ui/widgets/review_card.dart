import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/features/reviews/domain/models/review_model.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: colors.primaryWeak,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: colors.grey,
                child: ClipOval(
                  child: Image.network(
                    review.user.avatarUrl,
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.error_outline,
                      color: colors.error,
                      size: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 6),
              Text(
                "${review.user.firstName} ${review.user.lastName}",
                style: textStyle.base.copyWith(color: colors.heading),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            review.comment ?? "",
            style: textStyle.sm.copyWith(color: colors.bodyText),
          ),
        ],
      ),
    );
  }
}
