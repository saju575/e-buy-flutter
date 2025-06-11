import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/features/product/data/models/product_size_model.dart';
import 'package:flutter/material.dart';

class ProductSizeSelect extends StatefulWidget {
  const ProductSizeSelect({
    super.key,
    required this.sizeList,
    required this.onChange,
    required this.selectedSize,
  });
  final List<ProductSizeModel> sizeList;
  final ValueChanged<ProductSizeModel> onChange;
  final ProductSizeModel selectedSize;

  @override
  State<ProductSizeSelect> createState() => _ProductSizeSelectState();
}

class _ProductSizeSelectState extends State<ProductSizeSelect> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (ProductSizeModel size in widget.sizeList)
          GestureDetector(
            onTap: () {
              widget.onChange(size);
            },
            child: Container(
              // padding: const EdgeInsets.all(8),
              height: 28,
              width: 28,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: widget.selectedSize.id == size.id
                    ? colors.primary
                    : null,
                shape: BoxShape.circle,
                border: widget.selectedSize.id == size.id
                    ? null
                    : Border.all(color: colors.grey),
              ),
              child: Center(
                child: Text(
                  size.size,
                  style: textStyle.base.copyWith(
                    color: widget.selectedSize.id == size.id
                        ? colors.headingSecondary
                        : colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
