import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({super.key, this.color, this.strokeWidth, this.size});
  final Color? color;
  final double? strokeWidth;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 20,
      width: size ?? 20,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 2,
        color: color,
      ),
    );
  }
}
