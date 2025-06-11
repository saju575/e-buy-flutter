import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/widgets/app_icon.dart';
import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    super.key,
    this.height = 28,
    this.width = 28,
    required this.color,
    this.onChange,
    this.isSelected = false,
    required this.id,
  });
  final int id;
  final double width;
  final double height;
  final Color color;
  final bool isSelected;
  final Function(Color value, int id)? onChange;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: isSelected
            ? Center(
                child: AppIcon(
                  icon: Icons.done,
                  color: colors.headingSecondary,
                ),
              )
            : null,
      ),
    );
  }

  void _onTap() {
    onChange?.call(color, id);
  }
}
