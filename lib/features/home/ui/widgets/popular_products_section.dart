import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/features/home/ui/widgets/section_header.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class PopularProductsSection extends StatelessWidget {
  const PopularProductsSection({super.key});

  static const int _LENGTH = 10;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Column(
        children: [
          SectionHeader(
            title: "Popular",
            onTap: () {
              _moveToPopularProductList(context);
            },
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: _renderPopularItems(context),
          ),
        ],
      ),
    );
  }

  void _moveToPopularProductList(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.productList, arguments: "Popular");
  }

  Widget _renderPopularItems(BuildContext context) {
    return SizedBox(
      height: 142,
      child: ListView.builder(
        itemCount: _LENGTH,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: index != _LENGTH - 1 ? 16 : 0),
            child: FittedBox(
              child: ProductCard(
                width: 115,
                onTap: () => _moveToSpecificProduct(context, "1"),
              ),
            ),
          );
        },
      ),
    );
  }

  void _moveToSpecificProduct(BuildContext context, String id) {
    Navigator.pushNamed(context, AppRoutes.productDetails, arguments: id);
  }
}
