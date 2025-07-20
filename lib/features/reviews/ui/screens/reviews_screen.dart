import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/reviews/ui/controllers/review_controller.dart';
import 'package:e_buy/features/reviews/ui/widgets/bottom_review_action_bar.dart';
import 'package:e_buy/features/reviews/ui/widgets/review_card.dart';
import 'package:e_buy/middlewares/login_middleware.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key, required this.productId});
  static const name = '/reviews';
  final String productId;
  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final ScrollController _scrollController = ScrollController();
  final ReviewController _reviewListController = Get.find<ReviewController>();

  @override
  void initState() {
    super.initState();
    _reviewListController.loadInitialData(widget.productId);
    _scrollController.addListener(_handleScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reviews"), centerTitle: true),
      body: GetBuilder<ReviewController>(
        builder: (reviewContext) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RefreshIndicator(
                    onRefresh:
                        reviewContext.refreshData, // pull-to-refresh handler
                    child: reviewContext.initialLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          ) // Show loader on first fetch
                        : reviewContext.list.isEmpty
                        ? ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: const [
                              SizedBox(height: 200),
                              Center(child: Text("No reviews found")),
                            ],
                          )
                        : ListView.builder(
                            controller: _scrollController,
                            itemCount: reviewContext.hasNextPage
                                ? reviewContext.list.length +
                                      1 // Add 1 for the loader
                                : reviewContext.list.length,
                            itemBuilder: (context, index) {
                              if (index < reviewContext.list.length) {
                                return ReviewCard(
                                  review: reviewContext.list[index],
                                );
                              } else {
                                // Loader at the bottom for "load more"
                                return const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                ),
              ),
              BottomReviewActionBar(
                totalReviews: reviewContext.totalData,
                onTapButton: _moveToCreateReviewScreen,
              ),
            ],
          );
        },
      ),
    );
  }

  void _handleScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        _reviewListController.hasNextPage &&
        !_reviewListController.loadingMore) {
      _reviewListController.loadMore();
    }
  }

  void _moveToCreateReviewScreen() {
    guardRoute(
      context: context,
      onAllowed: () async {
        await Navigator.pushNamed(
          context,
          AppRoutes.createReview,
          arguments: widget.productId,
        );

        _scrollController.jumpTo(0);
      },
      fallbackArguments: {"goBack": true},
    );
  }
}
