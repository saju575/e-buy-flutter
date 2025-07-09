import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/features/product/domain/models/category_model.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key, required this.categoryModel, this.onTap});

  final CategoryModel categoryModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: colors.primaryWeak,
              ),
              child: Center(
                child: Image.network(
                  categoryModel.iconUrl,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  color: colors.primary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                categoryModel.title,
                maxLines: 1,
                // softWrap: true,
                textAlign: TextAlign.center,
                style: textStyle.base.copyWith(
                  color: colors.bodyText,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),

      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Container(
      //       width: 72,
      //       height: 72,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(8),
      //         color: colors.primaryWeak,
      //       ),
      //       child: Center(
      //         child: Image.network(
      //           categoryModel.iconUrl,
      //           width: 40,
      //           height: 40,
      //           fit: BoxFit.cover,
      //           color: colors.primary,
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 8),
      //     SizedBox(
      //       width: 100,
      //       child: Center(
      //         child: Text(
      //           categoryModel.title,
      //           maxLines: 1,
      //           style: textStyle.base.copyWith(
      //             color: colors.bodyText,
      //             fontWeight: FontWeight.w400,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
