import 'package:e_buy/app/extension/colors_extension.dart';
import 'package:e_buy/app/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.colors,
    required this.onSelected,
    this.selectedColor,
  });

  final List<String> colors;
  final String? selectedColor;
  final void Function(String) onSelected;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.selectedColor ?? widget.colors.first;
  }

  @override
  void didUpdateWidget(covariant ColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedColor != oldWidget.selectedColor &&
        widget.selectedColor != null) {
      setState(() {
        _selectedColor = widget.selectedColor!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyle;
    return Wrap(
      children: [
        for (String color in widget.colors)
          GestureDetector(
            onTap: () {
              _selectedColor = color;
              setState(() {});
              widget.onSelected(_selectedColor!);
            },
            child: Container(
              padding: EdgeInsets.all(6),
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: colors.grey),
                color: _selectedColor == color
                    ? colors.primary
                    : colors.primaryWeak,
              ),
              child: Text(
                color,
                style: textStyle.sm.copyWith(color: colors.headingSecondary),
              ),
            ),
          ),
      ],
    );
  }
}
