import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/features/home/ui/widgets/slider_card.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);
  final _items = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final colors = context.colors;
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: screenHeight / 4),
          child: CarouselSlider(
            options: CarouselOptions(
              height: screenHeight / 4,
              viewportFraction: 1,
              onPageChanged: (index, reason) => _currentIndex.value = index,
            ),
            items: _items
                .map(
                  (buildItem) =>
                      SliderCard(width: screenWidth, height: screenHeight),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: _currentIndex,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _items.length; i++)
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == value ? colors.primary : colors.grey,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
