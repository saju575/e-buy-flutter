import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:flutter/material.dart';

class SafeGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Future<void> Function() onRefresh;
  final bool isLoading;
  final bool isLoadingMore;
  final String? emptyMessage;
  final String? emptyImageAsset;
  final VoidCallback? onRetry;
  final SliverGridDelegate gridDelegate;
  final ScrollController? scrollController;

  const SafeGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onRefresh,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.emptyMessage = "No items found",
    this.emptyImageAsset,
    this.onRetry,
    required this.gridDelegate,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return RefreshIndicator(
      onRefresh: onRefresh,
      backgroundColor: colors.primaryWeak,
      color: colors.primary,
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (isLoading && items.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CircularProgressIndicator()),
            )
          else if (items.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (emptyImageAsset != null)
                      Image.asset(emptyImageAsset!, width: 150, height: 150),
                    const SizedBox(height: 16),
                    Text(
                      emptyMessage ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: onRetry ?? onRefresh,
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index < items.length) {
                    return itemBuilder(context, items[index], index);
                  } else {
                    // Show loading indicator at the end (for load more)
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }
                }, childCount: items.length + (isLoadingMore ? 1 : 0)),
                gridDelegate: gridDelegate,
              ),
            ),
        ],
      ),
    );
  }
}
