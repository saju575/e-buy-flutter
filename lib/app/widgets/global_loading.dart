// widgets/loading_wrapper.dart

import 'package:e_buy/app/widgets/circular_progress.dart';
import 'package:flutter/material.dart';

class GlobalLoading extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Widget? loadingWidget;

  const GlobalLoading({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: loadingWidget ?? const CircularProgress(size: 30));
    }
    return child;
  }
}
