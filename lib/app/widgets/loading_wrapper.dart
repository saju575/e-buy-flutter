// widgets/loading_wrapper.dart

import 'package:flutter/material.dart';

class LoadingWrapper extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Widget? loadingWidget;

  const LoadingWrapper({
    super.key,
    required this.isLoading,
    required this.child,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: loadingWidget ?? const CircularProgressIndicator());
    }
    return child;
  }
}
