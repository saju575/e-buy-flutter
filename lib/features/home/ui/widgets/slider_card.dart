import 'package:e_buy/app/assets/asset_paths.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({super.key, required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colors.primary,
      ),
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: Image.asset(AssetPaths.shoe)),
          SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Happy New Year Special Deal Save 20%",
                    style: textStyle.x2l.copyWith(
                      color: colors.headingSecondary,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    softWrap: true,
                    maxLines: 4,
                  ),
                  SizedBox(height: 8),
                  FittedBox(
                    child: SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors.headingSecondary,
                          foregroundColor: colors.primary,
                        ),
                        child: const Text("Shop Now"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
