import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/reviews/ui/widgets/bottom_review_action_bar.dart';
import 'package:e_buy/features/reviews/ui/widgets/review_card.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.productId});
  static const name = '/reviews';
  final String? productId;
  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reviews"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const ReviewCard(),
              ),
            ),
          ),
          BottomReviewActionBar(
            totalReviews: 10,
            onTapButton: _moveToCreateReviewScreen,
          ),
        ],
      ),
    );
  }

  void _moveToCreateReviewScreen() {
    Navigator.pushNamed(context, AppRoutes.createReview);
  }
}
