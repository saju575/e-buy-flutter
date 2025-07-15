import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    this.width,
    this.height,
    this.index,
    required this.item,
    this.enablePadding = true,
  });
  final double? width;
  final double? height;
  final int? index;
  final String item;
  final bool enablePadding;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final calculatedWidth = width ?? MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(enablePadding ? 16 : 0),
      decoration: BoxDecoration(color: colors.primaryWeak),
      width: width,
      height: height,
      child: Center(
        child: Image.network(item, fit: BoxFit.cover, width: calculatedWidth),
      ),
    );
  }
}
