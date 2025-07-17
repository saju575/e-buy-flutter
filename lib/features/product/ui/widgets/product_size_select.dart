import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class ProductSizeSelect extends StatefulWidget {
  const ProductSizeSelect({
    super.key,
    required this.sizeList,
    required this.onChange,
    this.selectedSize, // Make selectedSize optional
  });

  final List<String> sizeList;
  final ValueChanged<String> onChange;
  final String? selectedSize;

  @override
  State<ProductSizeSelect> createState() => _ProductSizeSelectState();
}

class _ProductSizeSelectState extends State<ProductSizeSelect> {
  late String localSize;

  @override
  void initState() {
    super.initState();
    localSize = widget.selectedSize ?? widget.sizeList.first;
  }

  @override
  void didUpdateWidget(covariant ProductSizeSelect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedSize != oldWidget.selectedSize &&
        widget.selectedSize != null) {
      setState(() {
        localSize = widget.selectedSize!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: widget.sizeList.map((size) {
        final isSelected = localSize == size;
        return GestureDetector(
          onTap: () {
            setState(() {
              localSize = size;
              widget.onChange(size);
            });
          },
          child: Container(
            height: 32,
            width: 32,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: isSelected ? colors.primary : null,
              shape: BoxShape.circle,
              border: isSelected
                  ? null
                  : Border.all(color: colors.grey, width: 1.2),
            ),
            child: Center(
              child: Text(
                size,
                style: textStyle.base.copyWith(
                  color: isSelected ? colors.headingSecondary : colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
