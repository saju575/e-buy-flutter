import 'package:e_buy/app/assets/app_icons.dart';
import 'package:e_buy/app/colors/app_colors.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:e_buy/app/routes/app_routes.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:e_buy/features/product/data/models/product_size_model.dart';
import 'package:e_buy/features/product/ui/widgets/product_size_select.dart';
import 'package:e_buy/features/product/ui/widgets/slider_card.dart';
import 'package:e_buy/features/shared/ui/widgets/widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.id});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();

  static const String name = "productDetailsScreen";
  final String? id;
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final List<Color> _colors = [Colors.red, Colors.green, Colors.blue];
  final List<ProductSizeModel> _sizeList = [
    ProductSizeModel(id: 1, size: "S"),
    ProductSizeModel(id: 2, size: "M"),
    ProductSizeModel(id: 3, size: "L"),
    ProductSizeModel(id: 4, size: "XL"),
  ];

  late final ValueNotifier<ProductSizeModel> _selectedSize;

  @override
  void dispose() {
    _selectedSize.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedSize = ValueNotifier(_sizeList.first);
  }

  final ValueNotifier<int> _selectedColorIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final textStyle = context.textStyle;
    final colors = context.colors;
    return Scaffold(
      extendBodyBehindAppBar: true, // Allows body behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Product Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _renderCarouselSlider(colors, screenHeight),
            const SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _renderTitle(textStyle, colors),
                  const SizedBox(height: 8),
                  _renderRatingAndReview(colors, textStyle),
                  const SizedBox(height: 14),
                  _renderHeading(
                    textStyle: textStyle,
                    colors: colors,
                    title: "Colors",
                  ),
                  const SizedBox(height: 6),
                  _renderColors(),
                  const SizedBox(height: 14),
                  _renderHeading(
                    textStyle: textStyle,
                    colors: colors,
                    title: "Size",
                  ),
                  const SizedBox(height: 6),
                  _renderSizes(),
                  const SizedBox(height: 14),
                  _renderHeading(
                    textStyle: textStyle,
                    colors: colors,
                    title: "Description",
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    style: textStyle.sm.copyWith(color: colors.bodyText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomPurchaseBar(
        title: "Price",
        price: 100,
        buttonText: "Add to Cart",
      ),
    );
  }

  Widget _renderHeading({
    required String title,
    required TextStyleTokens textStyle,
    required AppColors colors,
  }) {
    return Text(
      title,
      style: textStyle.lg.copyWith(
        color: colors.heading,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _renderCarouselSlider(AppColors colors, double screenHeight) {
    return AppCarouselSlider<int>(
      indicatorActiveColor: colors.primary,
      showIndicatorOnTop: true,
      height: screenHeight / 3,
      items: [1, 2, 3, 4],
      sliderCardBuilder: (width, height, index, item) =>
          SliderCard(item: item, width: width, height: height, index: index),
    );
  }

  Widget _renderTitle(TextStyleTokens textStyle, AppColors colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            "Happy New Year Special Shoe",
            style: textStyle.lg.copyWith(
              fontWeight: FontWeight.w600,
              color: colors.heading,
            ),
            maxLines: 2,
          ),
        ),
        Spacer(),
        IncrementDecrement(
          value: 01,
          onTapDecrement: () {},
          onTapIncrement: () {},
        ),
      ],
    );
  }

  Widget _renderRatingAndReview(AppColors colors, TextStyleTokens textStyle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIcon(iconName: AppIcons.star, color: colors.warning),
        SizedBox(width: 2),
        Text("4.5", style: textStyle.base.copyWith(color: colors.bodyText)),
        SizedBox(width: 16),
        GestureDetector(
          onTap: _moveToReviewScreen,
          child: Text(
            "Reviews",
            style: textStyle.base.copyWith(color: colors.primary),
          ),
        ),
        SizedBox(width: 16),
        AppIconButton(
          width: 22,
          height: 22,
          icon: AppIcon(
            iconName: AppIcons.heartOutline,
            color: colors.bodyText,
            size: 16,
          ),
        ),
      ],
    );
  }

  Widget _renderColors() {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedColorIndex,
      builder: (context, value, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(_colors.length, (index) {
            return Padding(
              padding: EdgeInsets.only(
                right: index < _colors.length - 1 ? 16 : 0,
              ),
              child: ColorButton(
                color: _colors[index],
                id: index,
                isSelected: index == _selectedColorIndex.value,
                onChange: (_, id) {
                  _selectedColorIndex.value = id;
                },
              ),
            );
          }),
        );
      },
    );
  }

  Widget _renderSizes() {
    return ValueListenableBuilder<ProductSizeModel>(
      valueListenable: _selectedSize,
      builder: (context, value, child) {
        return ProductSizeSelect(
          sizeList: _sizeList,
          onChange: (size) {
            _selectedSize.value = size;
          },
          selectedSize: value,
        );
      },
    );
  }

  void _moveToReviewScreen() {
    Navigator.pushNamed(context, AppRoutes.reviews);
  }
}
