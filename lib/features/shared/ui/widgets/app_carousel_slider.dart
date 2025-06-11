import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:flutter/material.dart';

class AppCarouselSlider<T extends dynamic> extends StatefulWidget {
  const AppCarouselSlider({
    super.key,
    this.showIndicatorOnTop = false,
    this.height,
    required this.sliderCardBuilder,
    required this.items,
  });
  final bool showIndicatorOnTop;
  final double? height;
  final List<T> items;
  final Widget Function(double width, double height, int index, T item)
  sliderCardBuilder;
  @override
  State<AppCarouselSlider<T>> createState() => _AppCarouselSliderState<T>();
}

class _AppCarouselSliderState<T> extends State<AppCarouselSlider<T>> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final colors = context.colors;
    final carouselHeight = widget.height ?? screenHeight / 4;

    final indicator = ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.items.length; i++)
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: i == value ? colors.secondary : colors.grey,
                ),
              ),
          ],
        );
      },
    );

    final carouselSlider = CarouselSlider(
      options: CarouselOptions(
        height: carouselHeight,
        viewportFraction: 1,
        onPageChanged: (index, reason) => _currentIndex.value = index,
      ),

      items: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        return widget.sliderCardBuilder(
          screenWidth,
          carouselHeight,
          index,
          item,
        );
      }),
    );

    if (widget.showIndicatorOnTop) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: carouselHeight),
            child: carouselSlider,
          ),
          Positioned(bottom: 18, child: indicator),
        ],
      );
    } else {
      return Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: carouselHeight),
            child: carouselSlider,
          ),
          const SizedBox(height: 8),
          indicator,
        ],
      );
    }
  }
}
