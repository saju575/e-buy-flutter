import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    this.width,
    this.height,
    this.index,
    required this.item,
  });
  final double? width;
  final double? height;
  final int? index;
  final int item;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final calculatedWidth = width ?? MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: colors.primaryWeak),
      width: width,
      height: height,
      child: Center(
        child: Image.asset(
          AssetPaths.shoe,
          fit: BoxFit.cover,
          width: calculatedWidth * 0.6,
        ),
      ),
    );
  }
}
